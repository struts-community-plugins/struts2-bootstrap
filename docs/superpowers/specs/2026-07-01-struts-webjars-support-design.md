# Design: WebJars Support in Struts (framework) + Bootstrap plugin consumer

**Date:** 2026-07-01
**Status:** Approved design, ready for implementation planning
**Author:** brainstormed with Claude Code

## Summary

Add first-class **WebJars support to Struts core** so that client-side libraries
packaged as WebJars (`org.webjars:*`, shipped under
`META-INF/resources/webjars/<name>/<version>/…`) can be referenced from templates
and tags by a **version-less logical path** and served through Struts' existing
static-content pipeline.

The **struts2-bootstrap plugin is the first consumer**: it drops its ~2000
manually-vendored Bootstrap and bootstrap-icons files in favour of
`org.webjars` dependencies, letting Renovate (already configured in this repo via
`.github/renovate.json`) auto-bump Bootstrap going forward.

This document is the requirements input for two separate implementation sessions:

1. **Struts framework session** (apache/struts repo) — build the WebJars mechanism.
2. **Plugin session** (this repo) — consume the mechanism.

## Motivation

Today the plugin vendors the full Bootstrap dist and the complete bootstrap-icons
set (~2000 SVGs + fonts + CSS/JS) directly under
`struts2-bootstrap-plugin/src/main/resources/template/bootstrap/`. Every Bootstrap
release requires a manual re-download and a noisy 2000-file commit (see prior
upgrade `cb6c9b3`, "Upgrade to bootstrap version 5.3.5"). Assets are served by
Struts' `DefaultStaticContentLoader` from the classpath under the UI
`staticContentPath`.

WebJars turn "manually re-vendor every release" into "Renovate opens a one-line
`pom.xml` bump PR". Because the repo already relies on Renovate for dependency
updates, this aligns the Bootstrap upgrade cadence with every other dependency.

## Decisions

| # | Decision | Choice | Rationale |
|---|----------|--------|-----------|
| Q0 | **Serving model** | **Struts serves** webjar assets through its static-content pipeline (`DefaultStaticContentLoader`), reusing existing content-type/caching/ETag handling. | Framework owns caching/security; works even where the servlet container does not auto-serve `META-INF/resources/`. Consistent with how Struts already serves its bundled assets. |
| 1 | **Version resolution** | Depend on **`webjars-locator-lite`** to map version-less path → versioned classpath resource. | Purpose-built for frameworks, dependency-light (adopted by Spring); avoids Struts reinventing classpath scanning. |
| 2 | **Framework→plugin contract** | Public **`WebJarUrlProvider` interface** (resolvable via the Struts container) **+ a thin `<s:webjar>` tag and `<@s.webjar>` FreeMarker macro** built on top. | Gives plugins a clean injectable Java seam and template ergonomics. The plugin's `head.ftl` calls the macro. |
| 3 | **URL prefix** | Serve under the **existing static content path**, e.g. `${staticContentPath}/webjars/bootstrap/css/bootstrap.min.css`. | Reuses the already-wired static dispatcher; no new servlet mapping; single enable/disable switch. |
| 4 | **Security / allowlist** | Hard-constrain resolution to the **`META-INF/resources/webjars/` root** with path normalization (block `..` traversal). **Optional allowlist** of webjar names via a constant; default = all webjars on classpath. | Struts now streams classpath bytes, so traversal protection is mandatory; allowlist is opt-in defense-in-depth. |
| 5 | **Cache-busting** | **Drop** the plugin's current `?s2b=${version}` query param. | The resolved version already lives in the URL path, which is inherently cache-stable. |
| 6 | **Min Struts version & degradation** | Land in the **next Struts 7.x minor**. New plugin major **hard-requires** it — **no** vendored fallback path. | A fallback doubles maintenance; a clean version gate is simpler. |
| 7 | **Plugin-side scope** | **Drop vendored Bootstrap + bootstrap-icons**, add `org.webjars` dependencies. **Keep `validation.js` / `validation.min.js`** vendored. | `validation.js` is the plugin's own custom form-validation script, not a WebJar; everything else moves. |

## Part 1 — Struts framework requirements

### 1.1 Resource resolution

- Given a logical path `<webjar>/<path-inside-webjar>` (e.g.
  `bootstrap/css/bootstrap.min.css`), resolve to the concrete classpath resource
  `META-INF/resources/webjars/<webjar>/<version>/<path>` using
  `webjars-locator-lite`.
- Resolution runs once and is cached (the locator scans at startup).
- If the webjar or path cannot be resolved, fail closed (404 / no URL emitted),
  never fall through to arbitrary classpath serving.

### 1.2 Serving

- Extend `DefaultStaticContentLoader` (or add a sibling loader wired into the same
  static dispatch) to handle requests under
  `<staticContentPath>/webjars/**`.
- Reuse existing content-type detection, `Last-Modified`/ETag, and browser-cache
  behaviour governed by `struts.serve.static` and
  `struts.serve.static.browserCache`.
- **Verify against the current apache/struts source** how `DefaultStaticContentLoader`
  maps request paths to classpath roots and where to hook the `/webjars` prefix —
  exact class/method names must be confirmed in the framework session before coding.

### 1.3 URL-building API (the cooperation surface)

- **`WebJarUrlProvider`** interface (public API, stable):
  - Resolves a logical webjar path to a servable URL, prefixed with the app
    context + `staticContentPath` + `/webjars` + resolved version + path.
  - Injectable/obtainable via the Struts container so plugins depend on the
    interface, not internals.
- **`<s:webjar path="…"/>` tag** and **`<@s.webjar path="…"/>` FreeMarker macro**:
  - Thin wrappers over `WebJarUrlProvider`.
  - Emit only the resolved URL string (so callers embed it in `<link>` / `<script>`
    themselves) OR optionally emit the full element — **decide during planning**;
    default recommendation: emit the URL string for composability.

### 1.4 Configuration constants

- `struts.webjars.enabled` (default `true`) — master switch.
- `struts.webjars.allowlist` (optional, comma-separated webjar names; empty = all).
- Reuse existing `struts.serve.static`, `struts.serve.static.browserCache`, and the
  UI `staticContentPath` — do **not** introduce a separate prefix constant unless
  the framework session finds a conflict.

### 1.5 Security

- Normalize and reject any resolved path escaping `META-INF/resources/webjars/`.
- Only serve resources whose resolved path is inside a known webjar (locator-backed),
  never raw classpath lookups.
- Honour the optional allowlist.

### 1.6 Dependencies

- Add `org.webjars:webjars-locator-lite` to Struts core.
- Confirm license compatibility (MIT) and transitive footprint during planning.

## Part 1 status — DELIVERED (2026-07-06)

Merged in apache/struts **PR #1765 / WW-5640**, in `main` = **7.2.2-SNAPSHOT**
(latest release still 7.2.1 — not yet in a published release). Delivered API:

- Macro **`<@s.webjar path="<webjar>/<path>" var="…"/>`** and JSP tag `<s:webjar>`,
  emitting the **resolved URL string** (composes with `<s:script>`/`<s:link>`).
- Served at **`<ctx>/static/webjars/<name>/<version>/<path>`**.
- Constants `struts.webjars.enabled` (default `true`), `struts.webjars.allowlist`.
- Resolver `org.webjars:webjars-locator-lite:1.1.3`.

## Part 2 — struts2-bootstrap plugin consumer changes

Depends on Struts **7.2.2** (buildable now against `7.2.2-SNAPSHOT`).

1. Add WebJar dependencies to the plugin `pom.xml`:
   - `org.webjars:bootstrap` (target 5.3.8 or newest at implementation time)
   - `org.webjars:bootstrap-icons` (or the NPM-flavoured
     `org.webjars.npm:bootstrap-icons` — **verify which artifact carries the
     expected `font/` + `fonts/` layout**; target 1.13.1).
   - **Verify each webjar's internal layout first** — the classic `org.webjars:bootstrap`
     webjar nests dist files (e.g. path may be `bootstrap/css/bootstrap.min.css` vs
     `bootstrap/dist/css/bootstrap.min.css`). The exact `path=` for `<@s.webjar>`
     depends on this and must be confirmed against the resolved jar.
2. Update `template/bootstrap/head.ftl` to use `<@s.webjar>` for:
   - `bootstrap.bundle.min.js` / `bootstrap.bundle.js`
   - `bootstrap.min.css` / `bootstrap.css`
   - the bootstrap-icons CSS
   - **Keep** `validation.min.js` / `validation.js` served as today (custom asset).
   - **Drop** the `?s2b=${version}` cache-buster from the webjar-served links.
3. Delete the vendored asset tree under `template/bootstrap/css/`,
   `template/bootstrap/js/` (Bootstrap files only), and
   `template/bootstrap/bootstrap-icons/**`.
4. Bump the plugin's minimum Struts version to **7.2.2** (`struts2.version`) and
   update the README compatibility table.
5. Verify the bootstrap-icons CSS `@font-face` `src` path still resolves when served
   from the webjar's own directory layout (the current vendored copy rewired it to
   `./fonts/…`; the webjar ships its canonical layout, so the icons CSS must be the
   webjar's own file, referenced via its webjar path).

## Testing strategy

**Framework (apache/struts):**
- Unit test `WebJarUrlProvider` resolution: known webjar path → expected versioned
  URL; unknown path → empty/404; traversal attempt (`../../`) → rejected.
- Integration test serving: request a served webjar asset, assert 200 + correct
  content-type + caching headers; assert allowlist blocks a non-listed webjar.
- Tag/macro test: `<@s.webjar>` renders the resolved URL.

**Plugin (this repo):**
- No unit-test harness exists today. Verify by:
  - `mvn -q -pl struts2-bootstrap-plugin package` builds cleanly.
  - Run the **showcase** against a Struts build containing Part 1; smoke-check that
    Bootstrap CSS/JS and a few `bi-*` icons load (network 200s, styled pages).

## Out of scope

- Container-served (`META-INF/resources` direct) model — rejected in favour of Q0(a).
- Changing the plugin's public tag API or FreeMarker templates beyond `head.ftl`.
- The showcase's custom `bootstrap-superhero.css` theme and legacy
  `glyphicons-*` fonts.
- The README plugin↔Struts↔Java compatibility semantics (only the version *numbers*
  in the table change).

## Open items to confirm during planning

- Exact hook point in `DefaultStaticContentLoader` (framework session must read
  current source).
- Whether `<@s.webjar>` emits a URL string vs. a full element (recommend URL string).
- Correct bootstrap-icons WebJar artifact/coordinates and its internal layout.
- `webjars-locator-lite` transitive dependencies and Struts version alignment.
