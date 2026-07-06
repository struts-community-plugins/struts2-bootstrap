# WebJars Plugin Consumer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the struts2-bootstrap plugin's ~2000 manually-vendored Bootstrap and bootstrap-icons files with `org.webjars` dependencies, served via Struts core's new `<@s.webjar>` mechanism.

**Architecture:** Bootstrap CSS/JS and bootstrap-icons come from WebJar JARs on the classpath; `head.ftl` resolves their URLs through the Struts `<@s.webjar>` FreeMarker macro (which emits `<ctx>/static/webjars/<name>/<version>/<path>`, served by Struts' static-content pipeline). The plugin keeps only its own custom `validation.js`/`validation.min.js` vendored. Version bumps become one-line `pom.xml` changes (auto-updatable via the repo's Renovate).

**Tech Stack:** Struts 7.2.2 (WebJars support, WW-5640/PR #1765), Maven, FreeMarker templates, `org.webjars:bootstrap`, `org.webjars.npm:bootstrap-icons`.

## Global Constraints

- **Struts floor:** 7.2.2 (the release containing WebJars support). Until 7.2.2 is published, build against `7.2.2-SNAPSHOT` (see Prerequisites).
- **Java:** 17.
- **Target asset versions:** Bootstrap `5.3.8`, bootstrap-icons `1.13.1`.
- **Keep vendored:** `template/bootstrap/js/validation.js` and `validation.min.js` (the plugin's own script — NOT a WebJar). Everything else Bootstrap/icons is deleted.
- **Drop** the `?s2b=${version}` cache-buster on WebJar-served links (version is already in the resolved path). Keep it only on the still-vendored `validation.js` link.
- **`head.ftl` is Maven resource-filtered** (`struts2-bootstrap-plugin/pom.xml` filters exactly this one file so `${version}` is injected). Do not break that filtering.
- **Commit convention:** `<type>: <desc>` (no JIRA ticket in this repo). Branch off, never commit to `release/*`.
- **Delivered Struts API:** macro `<@s.webjar path="<webjar>/<path>"/>` emits the resolved URL string; captured via FreeMarker `<#assign … >…</#assign>`. Constants `struts.webjars.enabled` (default `true`), `struts.webjars.allowlist` (empty = all).
- **Verified WebJar layouts (from Maven Central):**
  - `org.webjars:bootstrap:5.3.8` → `META-INF/resources/webjars/bootstrap/5.3.8/css/bootstrap[.min].css`, `js/bootstrap.bundle[.min].js` (no `dist/` nesting).
  - `org.webjars.npm:bootstrap-icons:1.13.1` → `.../bootstrap-icons/1.13.1/font/bootstrap-icons[.min].css` + `font/fonts/bootstrap-icons.woff2`. The icons CSS uses a relative `./fonts/…` font-face URL that resolves correctly when served from its `font/` dir — **no path rewriting needed**.

## Prerequisites

- **Struts 7.2.2 must be resolvable.** If it is already released to Maven Central, no extra config is needed. If not yet released, temporarily add the Apache snapshots repository to the **root** `pom.xml` and set `struts2.version` to `7.2.2-SNAPSHOT`:

```xml
<repositories>
    <repository>
        <id>apache-snapshots</id>
        <url>https://repository.apache.org/content/repositories/snapshots/</url>
        <releases><enabled>false</enabled></releases>
        <snapshots><enabled>true</enabled></snapshots>
    </repository>
</repositories>
```

Remove this repository block (and switch `7.2.2-SNAPSHOT` → `7.2.2`) before the plugin release.

## File Structure

- `pom.xml` (root) — bump `struts2.version`; add WebJar version properties + `dependencyManagement` entries.
- `struts2-bootstrap-plugin/pom.xml` — declare the two WebJar dependencies.
- `struts2-bootstrap-plugin/src/main/resources/template/bootstrap/head.ftl` — resolve Bootstrap/icons URLs via `<@s.webjar>`.
- `struts2-bootstrap-plugin/src/main/resources/template/bootstrap/css/**`, `js/bootstrap*.*`, `bootstrap-icons/**` — **deleted** (vendored assets removed; `validation.*` kept).
- `README.md` — compatibility table + install snippet.

---

### Task 1: Add WebJar dependencies and raise the Struts floor to 7.2.2

**Files:**
- Modify: `pom.xml` (root) — `<properties>` (line ~67) and `<dependencyManagement>` (lines 224-250)
- Modify: `struts2-bootstrap-plugin/pom.xml` — `<dependencies>` (lines 67-91)

**Interfaces:**
- Produces: WebJar artifacts on the plugin's compile/runtime classpath (`org.webjars:bootstrap:5.3.8`, `org.webjars.npm:bootstrap-icons:1.13.1`) and Struts `7.2.2`, consumed by Task 2's `head.ftl` and Task 5's runtime verification.

- [ ] **Step 1: Bump `struts2.version` in root `pom.xml`**

Change line 67 from:

```xml
        <struts2.version>7.2.1</struts2.version>
```

to (use `7.2.2-SNAPSHOT` per Prerequisites if 7.2.2 is not yet released):

```xml
        <struts2.version>7.2.2</struts2.version>
```

- [ ] **Step 2: Add WebJar version properties in root `pom.xml`**

Immediately after the `struts2.version` line, add:

```xml
        <webjars-bootstrap.version>5.3.8</webjars-bootstrap.version>
        <webjars-bootstrap-icons.version>1.13.1</webjars-bootstrap-icons.version>
```

- [ ] **Step 3: Add WebJar `dependencyManagement` entries in root `pom.xml`**

Inside `<dependencyManagement><dependencies>` (before the closing `</dependencies>` at line 249), add:

```xml
            <dependency>
                <groupId>org.webjars</groupId>
                <artifactId>bootstrap</artifactId>
                <version>${webjars-bootstrap.version}</version>
            </dependency>
            <dependency>
                <groupId>org.webjars.npm</groupId>
                <artifactId>bootstrap-icons</artifactId>
                <version>${webjars-bootstrap-icons.version}</version>
            </dependency>
```

- [ ] **Step 4: Declare the WebJar dependencies in `struts2-bootstrap-plugin/pom.xml`**

Inside `<dependencies>` (after the `struts2-core` dependency, ~line 76), add:

```xml
        <dependency>
            <groupId>org.webjars</groupId>
            <artifactId>bootstrap</artifactId>
        </dependency>
        <dependency>
            <groupId>org.webjars.npm</groupId>
            <artifactId>bootstrap-icons</artifactId>
        </dependency>
```

- [ ] **Step 5: Verify resolution**

Run: `mvn -q -pl struts2-bootstrap-plugin -am dependency:tree -Dincludes=org.webjars:bootstrap,org.webjars.npm:bootstrap-icons,org.apache.struts:struts2-core`

Expected: output lists `org.webjars:bootstrap:jar:5.3.8`, `org.webjars.npm:bootstrap-icons:jar:1.13.1`, and `org.apache.struts:struts2-core:jar:7.2.2` (or `:7.2.2-SNAPSHOT`) with no resolution errors.

- [ ] **Step 6: Commit**

```bash
git add pom.xml struts2-bootstrap-plugin/pom.xml
git commit -m "build: add bootstrap/bootstrap-icons webjars, require struts 7.2.2"
```

---

### Task 2: Resolve Bootstrap/icons URLs via `<@s.webjar>` in `head.ftl`

**Files:**
- Modify: `struts2-bootstrap-plugin/src/main/resources/template/bootstrap/head.ftl` (full rewrite of the logic below the license header)

**Interfaces:**
- Consumes: the WebJar classpath from Task 1 and Struts' `<@s.webjar>` macro.
- Produces: rendered `<script>`/`<link>` tags pointing at `<ctx>/static/webjars/bootstrap/5.3.8/…` and `…/bootstrap-icons/1.13.1/font/…`, verified in Task 5.

- [ ] **Step 1: Replace the body of `head.ftl`**

Keep the existing Apache license header comment block unchanged. Replace everything from `<#assign struts2BootstrapVersion=...>` to end-of-file with:

```ftl
<#assign struts2BootstrapVersion="${version}"><#rt/>
<#if attributes.compressed!true>
    <#assign jsFile="bootstrap/js/bootstrap.bundle.min.js"><#rt/>
    <#assign cssFile="bootstrap/css/bootstrap.min.css"><#rt/>
    <#assign cssIconsFile="bootstrap-icons/font/bootstrap-icons.min.css"><#rt/>
    <#assign validationFile="validation.min.js"><#rt/>
<#else>
    <#assign jsFile="bootstrap/js/bootstrap.bundle.js"><#rt/>
    <#assign cssFile="bootstrap/css/bootstrap.css"><#rt/>
    <#assign cssIconsFile="bootstrap-icons/font/bootstrap-icons.css"><#rt/>
    <#assign validationFile="validation.js"><#rt/>
</#if>
<#if attributes.includeScripts!true>
<@s.webjar path="${jsFile}" var="s2bJsUrl"/><#rt/>
<@s.script src="%{#s2bJsUrl}"/>
</#if>
<#if attributes.includeScriptsValidation!true>
<@s.script src="${base}${attributes.staticContentPath}/bootstrap/js/${validationFile}?s2b=${struts2BootstrapVersion}"/>
</#if>
<#if attributes.includeStyles!true>
<@s.webjar path="${cssFile}" var="s2bCssUrl"/><#rt/>
<@s.link id="bootstrap_styles" rel="stylesheet" href="%{#s2bCssUrl}" type="text/css"/>
<@s.webjar path="${cssIconsFile}" var="s2bIconsUrl"/><#rt/>
<@s.link id="bootstrap_styles_icons" rel="stylesheet" href="%{#s2bIconsUrl}" type="text/css"/>
</#if>
```

Notes for the implementer:
- Use the `<@s.webjar var="…">` attribute: the tag stores the resolved URL in the value-stack context (`putInContext`). Reference it in `<@s.script>`/`<@s.link>` via OGNL `%{#var}` — both components OGNL-evaluate `src`/`href` through `findString`, so the context var resolves.
- Do **not** try to capture the macro output with `<#assign name>…</#assign>`: in an HTML-output template that yields a FreeMarker `markup_output`, which `?trim`/string built-ins reject.
- The `validation.js` link is intentionally left on the old vendored `${staticContentPath}/bootstrap/js/…` path with `?s2b=` — it stays vendored (Task 3 keeps it).
- Icons now honour `compressed` (min vs non-min); the previous template always used the non-min icons CSS.

- [ ] **Step 2: Build to confirm the template still filters/packages**

Run: `mvn -q -pl struts2-bootstrap-plugin -am -DskipTests package`
Expected: BUILD SUCCESS; `struts2-bootstrap-plugin/target/classes/template/bootstrap/head.ftl` exists and (via resource filtering) contains the real version string in `struts2BootstrapVersion` (no literal `${version}`).

- [ ] **Step 3: Confirm the filtered output**

Run: `grep -c 's.webjar' struts2-bootstrap-plugin/target/classes/template/bootstrap/head.ftl`
Expected: `3` (js, css, icons).

- [ ] **Step 4: Commit**

```bash
git add struts2-bootstrap-plugin/src/main/resources/template/bootstrap/head.ftl
git commit -m "feat: resolve bootstrap assets via struts webjar macro"
```

---

### Task 3: Remove the vendored Bootstrap and bootstrap-icons assets

**Files:**
- Delete: `struts2-bootstrap-plugin/src/main/resources/template/bootstrap/css/` (entire dir)
- Delete: `struts2-bootstrap-plugin/src/main/resources/template/bootstrap/bootstrap-icons/` (entire dir)
- Delete: the Bootstrap files under `struts2-bootstrap-plugin/src/main/resources/template/bootstrap/js/` (`bootstrap*.js`, `*.map`), **keeping** `validation.js` and `validation.min.js`

**Interfaces:**
- Consumes: nothing (pure deletion). Safe only after Task 2 stops referencing these paths.

- [ ] **Step 1: Delete the vendored CSS and icons directories**

```bash
cd /Users/lukaszlenart/Projects/StrutCommunityPlugins/struts2-bootstrap
git rm -r struts2-bootstrap-plugin/src/main/resources/template/bootstrap/css
git rm -r struts2-bootstrap-plugin/src/main/resources/template/bootstrap/bootstrap-icons
```

- [ ] **Step 2: Delete the vendored Bootstrap JS, keep `validation.*`**

```bash
git rm struts2-bootstrap-plugin/src/main/resources/template/bootstrap/js/bootstrap*
```

- [ ] **Step 3: Confirm `validation.*` survives and Bootstrap files are gone**

Run: `ls struts2-bootstrap-plugin/src/main/resources/template/bootstrap/js/`
Expected: exactly two files — `validation.js` and `validation.min.js`. (The `js/` dir contains only `bootstrap*` and `validation*` files; the `git rm bootstrap*` in Step 2 removes every `bootstrap.*`/`bootstrap.*.map` entry and leaves the two `validation` files.)

- [ ] **Step 4: Rebuild to confirm nothing references the deleted files**

Run: `mvn -q -pl struts2-bootstrap-plugin -am -DskipTests package`
Expected: BUILD SUCCESS.

- [ ] **Step 5: Commit**

```bash
git add -A struts2-bootstrap-plugin/src/main/resources/template/bootstrap/
git commit -m "chore: remove vendored bootstrap and bootstrap-icons assets"
```

---

### Task 4: Update README compatibility table and install snippet

**Files:**
- Modify: `README.md` (version table at lines ~18-25; Maven install snippet at ~line 34)

**Interfaces:**
- Consumes: the Struts floor (7.2.2) and the next plugin version.

- [ ] **Step 1: Add a compatibility row**

At the top of the table body (after the header/separator, before the `6.0.0` row at line 20), add a row for the new plugin version (use the version this change will release as — confirm the intended number; shown here as `6.2.0`):

```markdown
| `6.2.0`                     | version >= `7.2.2` | Java 17        |
```

- [ ] **Step 2: Update the Maven install snippet**

Change the `<version>6.0.0</version>` in the install example (line ~34) to the new version, e.g. `6.2.0`.

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "docs: document struts 7.2.2 requirement for webjars build"
```

---

### Task 5: End-to-end verification via the showcase

**Files:** none (verification only).

**Interfaces:**
- Consumes: the full built reactor from Tasks 1-3.

- [ ] **Step 1: Build the whole reactor**

Run: `mvn -q -DskipTests install`
Expected: BUILD SUCCESS for `bootstrap` (parent), `struts2-bootstrap-plugin`, and `struts2-bootstrap-showcase`. If the showcase fails on a transitive `struts2-jquery-plugin` incompatibility with Struts 7.2.2, note it — that is a showcase dependency-alignment issue, not a plugin defect.

- [ ] **Step 2: Run the showcase**

Run: `mvn -pl struts2-bootstrap-showcase jetty:run` (leave running in a background shell)
Expected: Jetty starts and serves on its configured port (default `http://localhost:8080/`).

- [ ] **Step 3: Assert the rendered page emits WebJar URLs**

Run: `curl -s http://localhost:8080/ | grep -oE '/static/webjars/[^"?]+' | sort -u`
Expected: lines including
`/static/webjars/bootstrap/5.3.8/css/bootstrap.min.css`,
`/static/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js`,
`/static/webjars/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css`.

- [ ] **Step 4: Assert the assets are actually served (HTTP 200)**

Run:
```bash
for u in \
  /static/webjars/bootstrap/5.3.8/css/bootstrap.min.css \
  /static/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js \
  /static/webjars/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css \
  /static/webjars/bootstrap-icons/1.13.1/font/fonts/bootstrap-icons.woff2 ; do
  echo "$u -> $(curl -s -o /dev/null -w '%{http_code} %{content_type}' http://localhost:8080$u)"
done
```
Expected: each line ends in `200` with a sensible content-type (`text/css`, `text/javascript`/`application/javascript`, `font/woff2`). The `.woff2` 200 confirms the icons CSS's relative `./fonts/…` reference resolves.

- [ ] **Step 5: Eyeball a page**

Open `http://localhost:8080/` in a browser: confirm Bootstrap styling is applied and at least one `bi-*` icon renders (glyph, not a missing-font box). Stop Jetty when done.

---

## Notes / open confirmations before release

- **Plugin release version:** Task 4 assumes `6.2.0` — confirm the actual next version and update the parent `pom.xml` `<version>` via the normal release process (not part of these tasks).
- **SNAPSHOT cleanup:** if built against `7.2.2-SNAPSHOT`, remove the Apache snapshots repo and pin `7.2.2` before releasing.
- **Renovate:** once merged, add/confirm Renovate tracks `org.webjars:bootstrap` and `org.webjars.npm:bootstrap-icons` so future Bootstrap bumps are automated.
