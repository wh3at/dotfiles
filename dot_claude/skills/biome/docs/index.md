---
title: "Getting Started | Biome"
source_url: "https://biomejs.dev/guides/getting-started/index"
fetched_at: "2025-12-11T04:47:39.153021+00:00"
---



# Getting Started

Biome is best installed as a development dependency of your projects, but it is
also available as a [standalone executable](https://biomejs.dev/guides/manual-installation) that doesn’t require Node.js.

* [npm](https://biomejs.dev/guides/getting-started/index.html#tab-panel-167)
* [pnpm](https://biomejs.dev/guides/getting-started/index.html#tab-panel-168)
* [bun](https://biomejs.dev/guides/getting-started/index.html#tab-panel-169)
* [deno](https://biomejs.dev/guides/getting-started/index.html#tab-panel-170)
* [yarn](https://biomejs.dev/guides/getting-started/index.html#tab-panel-171)

```
1

npm i -D -E @biomejs/biome
```

```
1

pnpm add -D -E @biomejs/biome
```

```
1

bun add -D -E @biomejs/biome
```

```
1

deno add -D npm:@biomejs/biome
```

```
1

yarn add -D -E @biomejs/biome
```



Version pinning

`-E` ensures that the package manager pins the version of Biome. See the
[versioning page](https://biomejs.dev/internals/versioning)
for more information about [why pinning the version is important](https://biomejs.dev/internals/versioning#why-pinning-the-version-is-important).

## Configuration

[Section titled “Configuration”](https://biomejs.dev/guides/getting-started/index.html#configuration)

Although Biome can run with zero configuration, you’ll likely want to tweak some
settings to suit your project’s needs, in which case you can run the following
command to generate a `biome.json` configuration file.

* [npm](https://biomejs.dev/guides/getting-started/index.html#tab-panel-172)
* [pnpm](https://biomejs.dev/guides/getting-started/index.html#tab-panel-173)
* [bun](https://biomejs.dev/guides/getting-started/index.html#tab-panel-174)
* [deno](https://biomejs.dev/guides/getting-started/index.html#tab-panel-175)
* [yarn](https://biomejs.dev/guides/getting-started/index.html#tab-panel-176)

```
1

npx @biomejs/biome init
```

```
1

pnpm exec biome init
```

```
1

bunx --bun biome init
```

```
1

deno run -A npm:@biomejs/biome init
```

```
1

yarn exec biome init
```



## Usage

[Section titled “Usage”](https://biomejs.dev/guides/getting-started/index.html#usage)

Lets get a quick overview of how to use Biome in your project.

### Command-line interface

[Section titled “Command-line interface”](https://biomejs.dev/guides/getting-started/index.html#command-line-interface)

Biome provides a [command-line interface](https://biomejs.dev/reference/cli) to format, lint, and check your code.

* [npm](https://biomejs.dev/guides/getting-started/index.html#tab-panel-177)
* [pnpm](https://biomejs.dev/guides/getting-started/index.html#tab-panel-178)
* [bun](https://biomejs.dev/guides/getting-started/index.html#tab-panel-179)
* [deno](https://biomejs.dev/guides/getting-started/index.html#tab-panel-180)
* [yarn](https://biomejs.dev/guides/getting-started/index.html#tab-panel-181)

```
1

# Format all files

2

npx @biomejs/biome format --write

3

4

# Format specific files

5

npx @biomejs/biome format --write <files>

6

7

# Lint files and apply safe fixes to all files

8

npx @biomejs/biome lint --write

9

10

# Lint files and apply safe fixes to specific files

11

npx @biomejs/biome lint --write <files>

12

13

# Format, lint, and organize imports of all files

14

npx @biomejs/biome check --write

15

16

# Format, lint, and organize imports of specific files

17

npx @biomejs/biome check --write <files>
```

```
1

# Format all files

2

pnpm exec biome format --write

3

4

# Format specific files

5

pnpm exec biome format --write <files>

6

7

# Lint and apply safe fixes to all files

8

pnpm exec biome lint --write

9

10

# Lint files and apply safe fixes to specific files

11

pnpm exec biome lint --write <files>

12

13

# Format, lint, and organize imports of all files

14

pnpm exec biome check --write

15

16

# Format, lint, and organize imports of specific files

17

pnpm exec biome check --write <files>
```

```
1

# Format all files

2

bunx biome format --write

3

4

# Format specific files

5

bunx biome format --write <files>

6

7

# Lint and apply safe fixes to all files

8

bunx biome lint --write

9

10

# Lint files and apply safe fixes to specific files

11

bunx biome lint --write <files>

12

13

# Format, lint, and organize imports of all files

14

bunx biome check --write

15

16

# Format, lint, and organize imports of specific files

17

bunx biome check --write <files>
```

```
1

# Format specific files

2

deno run -A npm:@biomejs/biome format --write <files>

3

4

# Format all files

5

deno run -A npm:@biomejs/biome format --write

6

7

# Lint files and apply safe fixes to all files

8

deno run -A npm:@biomejs/biome lint --write

9

10

# Lint files and apply safe fixes to specific files

11

deno run -A npm:@biomejs/biome lint --write <files>

12

13

# Format, lint, and organize imports of all files

14

deno run -A npm:@biomejs/biome check --write

15

16

# Format, lint, and organize imports of specific files

17

deno run -A npm:@biomejs/biome check --write <files>
```

```
1

# Format all files

2

yarn exec biome format --write

3

4

# Format specific files

5

yarn exec biome format --write <files>

6

7

# Lint files and apply safe fixes to all files

8

yarn exec biome lint --write

9

10

# Lint files and apply safe fixes to specific files

11

yarn exec biome lint --write <files>

12

13

# Format, lint, and organize imports of all files

14

yarn exec biome check --write

15

16

# Format, lint, and organize imports of specific files

17

yarn exec biome check --write <files>
```



### Editor integrations

[Section titled “Editor integrations”](https://biomejs.dev/guides/getting-started/index.html#editor-integrations)

Biome is available as a first-party extension in your favorite editors.

* [VS Code](https://biomejs.dev/guides/editors/first-party-extensions#vs-code)
* [IntelliJ](https://biomejs.dev/guides/editors/first-party-extensions#intellij)
* [Zed](https://biomejs.dev/guides/editors/first-party-extensions#zed)

There are also [community extensions](https://biomejs.dev/guides/editors/third-party-extensions)
for other editors, such as **Vim**, **Neovim**, and **Sublime Text**, to name
a few.

### Continuous Integration

[Section titled “Continuous Integration”](https://biomejs.dev/guides/getting-started/index.html#continuous-integration)

Run `biome ci` as part of your CI pipeline to enforce code quality and consistency
across your team. It works just like the `biome check` command, but is optimized for
CI environments.

* [GitHub Actions](https://biomejs.dev/recipes/continuous-integration#github-actions)
* [GitLab CI](https://biomejs.dev/recipes/continuous-integration#gitlab-ci)

See the [Continuous Integration](https://biomejs.dev/recipes/continuous-integration) recipes for more examples.

## Next Steps

[Section titled “Next Steps”](https://biomejs.dev/guides/getting-started/index.html#next-steps)

Success! You’re now ready to use Biome. 🥳

* [Migrate from ESLint and Prettier](https://biomejs.dev/guides/migrate-eslint-prettier)
* Learn more about how to [configure Biome](https://biomejs.dev/guides/configure-biome)
* Learn more about how to use and configure the [formatter](https://biomejs.dev/formatter)
* Learn more about how to use and configure the [linter](https://biomejs.dev/linter)
* Get familiar with the [CLI commands and options](https://biomejs.dev/reference/cli)
* Get familiar with the [configuration options](https://biomejs.dev/reference/configuration)
* Join our [community on Discord](https://biomejs.dev/chat)

Sponsored by

![Depot](https://biomejs.dev/_astro/depot-logo-horizontal-on-light@3x.CwT7__a0_Z1k23Gh.webp?dpl=6938569bd7560e0008b27aa6) ![Depot](https://biomejs.dev/_astro/depot-logo-horizontal-on-dark@3x.BWjsBfKV_Z29sH19.webp?dpl=6938569bd7560e0008b27aa6)

Copyright (c) 2023-present Biome Developers and Contributors.
