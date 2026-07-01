# Spec: WebJars support in Struts core

**Date:** 2026-07-01
**Status:** Design approved — ready to start implementation in the apache/struts repo
**Scope:** Framework only. This document is self-contained and portable to the
Struts repo. The plugin-side consumer work is tracked separately and starts only
after this ships in a Struts release.

> ASF process note: real work in apache/struts needs a `WW-` JIRA ticket; commit
> messages must be prefixed with it. This spec is the pre-work that feeds that
> ticket, not a substitute for the ASF contribution process.

## Goal

Add first-class **WebJars** support to Struts core so client-side libraries
packaged as WebJars (`org.webjars:*`, shipped under
`META-INF/resources/webjars/<name>/<version>/…`) can be referenced from templates
and tags by a **version-less logical path** and served through Struts' existing
static-content pipeline.

Example: a template references `bootstrap/css/bootstrap.min.css`; Struts resolves
and serves `META-INF/resources/webjars/bootstrap/5.3.8/css/bootstrap.min.css`.

## Motivation

Plugins and applications currently vendor client-side assets directly on the
classpath and re-download them on every upgrade. The struts2-bootstrap plugin, for
example, commits ~2000 Bootstrap + bootstrap-icons files and re-vendors them by
hand each release. WebJars replace this with a dependency bump (auto-updatable via
Renovate/Dependabot). Struts should let plugins reference WebJar assets by a stable,
version-less path and handle resolution + serving centrally.

**First consumer:** the struts2-bootstrap plugin (separate repo, separate work).

## Decisions (fixed)

| # | Decision | Choice | Rationale |
|---|----------|--------|-----------|
| Q0 | **Serving model** | **Struts serves** webjar assets through its static-content pipeline (`DefaultStaticContentLoader`), reusing existing content-type / caching / ETag handling. | Framework owns caching + security; works even where the servlet container does not auto-serve `META-INF/resources/`. Consistent with how Struts already serves its bundled assets. |
| 1 | **Version resolution** | Depend on **`webjars-locator-lite`** to map version-less path → versioned classpath resource. | Purpose-built for frameworks, dependency-light (adopted by Spring); avoids reinventing classpath scanning. |
| 2 | **Public contract** | **`WebJarUrlProvider` interface** (resolvable via the Struts container) **+ a thin `<s:webjar>` tag and `<@s.webjar>` FreeMarker macro** on top. | Clean injectable Java seam for plugins + template ergonomics. |
| 3 | **URL prefix** | Serve under the **existing static content path**, e.g. `${staticContentPath}/webjars/bootstrap/css/bootstrap.min.css`. | Reuses the already-wired static dispatcher; no new servlet mapping; single enable/disable switch. |
| 4 | **Security / allowlist** | Hard-constrain resolution to the **`META-INF/resources/webjars/` root** with path normalization (block `..` traversal). **Optional allowlist** of webjar names via a constant; default = all webjars on classpath. | Struts streams classpath bytes, so traversal protection is mandatory; allowlist is opt-in defense-in-depth. |
| 5 | **Cache-busting** | No query-param cache-buster needed; the resolved **version lives in the URL path**. | Versioned URLs are inherently cache-stable. |
| 6 | **Target release** | Land in the **next Struts 7.x minor**. | — |

## Requirements

### R1 — Resource resolution
- Given a logical path `<webjar>/<path-inside-webjar>` (e.g.
  `bootstrap/css/bootstrap.min.css`), resolve to the concrete classpath resource
  `META-INF/resources/webjars/<webjar>/<version>/<path>` via `webjars-locator-lite`.
- Resolution result is cached (the locator scans the classpath at startup).
- On unresolved webjar/path: **fail closed** (404 when serving; no URL emitted when
  building). Never fall through to arbitrary classpath serving.

### R2 — Serving
- Extend `DefaultStaticContentLoader` (or add a sibling loader wired into the same
  static dispatch) to handle requests under `<staticContentPath>/webjars/**`.
- Reuse existing content-type detection, `Last-Modified`/ETag, and browser-cache
  behaviour governed by `struts.serve.static` and `struts.serve.static.browserCache`.
- **First implementation task:** read the current apache/struts source and confirm
  how `DefaultStaticContentLoader` maps request paths to classpath roots and the
  exact hook point for the `/webjars` prefix. Class/method names below are indicative
  and must be verified before coding.

### R3 — URL-building API (the cooperation surface)
- **`WebJarUrlProvider`** — public, stable interface:
  - Resolves a logical webjar path to a servable URL composed of
    app context + `staticContentPath` + `/webjars` + resolved version + path.
  - Obtainable via the Struts container so plugins depend on the interface, not
    internals.
- **`<s:webjar path="…"/>` tag** and **`<@s.webjar path="…"/>` FreeMarker macro**:
  - Thin wrappers over `WebJarUrlProvider`.
  - Recommended behaviour: **emit the resolved URL string** (caller embeds it in
    `<link>`/`<script>`), for composability. Emitting a full element is an option to
    settle during implementation.

### R4 — Configuration constants
- `struts.webjars.enabled` (default `true`) — master switch.
- `struts.webjars.allowlist` (optional, comma-separated webjar names; empty = all).
- Reuse existing `struts.serve.static`, `struts.serve.static.browserCache`, and the
  UI `staticContentPath`. Do **not** add a separate prefix constant unless a conflict
  is found.

### R5 — Security
- Normalize and reject any resolved path escaping `META-INF/resources/webjars/`.
- Only serve resources whose resolved path is inside a known (locator-backed) webjar;
  never raw classpath lookups.
- Honour the optional allowlist.

### R6 — Dependencies
- Add `org.webjars:webjars-locator-lite` to Struts core.
- Confirm license compatibility (MIT — ASF-compatible) and transitive footprint.

## Testing

- **Unit — resolution:** known path → expected versioned URL; unknown path →
  empty/404; traversal attempt (`../../…`) → rejected; allowlist blocks a
  non-listed webjar.
- **Integration — serving:** request a served webjar asset → 200 + correct
  content-type + caching headers; `struts.webjars.enabled=false` → not served.
- **Tag/macro:** `<@s.webjar>` / `<s:webjar>` renders the resolved URL.

## Out of scope
- Container-served model (relying on Servlet `META-INF/resources` auto-serving) —
  rejected in favour of Q0.
- The consuming plugin's changes (separate work, separate repo).

## Open items to confirm during implementation
- Exact hook point in `DefaultStaticContentLoader` (verify against current source).
- `<@s.webjar>` emits a URL string vs. a full element (recommend URL string).
- `webjars-locator-lite` transitive dependencies and Struts version alignment.
