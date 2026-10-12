---
title: "Usage with SvelteKit | Feature-Sliced Design"
source_url: "https://feature-sliced.design/docs/guides/tech/with-sveltekit"
fetched_at: "2025-12-24T01:59:28.495697+00:00"
---



* * 🎯 Guides* Tech* Usage with SvelteKit

On this page

It is possible to implement FSD in a SvelteKit project, but conflicts arise due to the differences between the structure requirements of a SvelteKit project and the principles of FSD:

* Initially, SvelteKit offers a file structure inside the `src/routes` folder, while in FSD the routing must be part of the `app` layer.
* SvelteKit suggests putting everything not related to routing in the `src/lib` folder.

## Let's set up the config[​](https://feature-sliced.design/docs/guides/tech/with-sveltekit.html#lets-set-up-the-config "Direct link to heading")

svelte.config.ts

```
import adapter from '@sveltejs/adapter-auto';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

/** @type {import('@sveltejs/kit').Config}*/
const config = {
  preprocess: [vitePreprocess()],
  kit: {
    adapter: adapter(),
    files: {
      routes: 'src/app/routes',             // move routing inside the app layer
      lib: 'src',
      appTemplate: 'src/app/index.html',    // Move the application entry point inside the app layer
      assets: 'public'
    },
    alias: {
      '@/*': 'src/*'                        // Create an alias for the src directory
    }
  }
};
export default config;
```

## Move file routing to `src/app`.[​](https://feature-sliced.design/docs/guides/tech/with-sveltekit.html#move-file-routing-to-srcapp "Direct link to heading")

Let's create an app layer, move the app's entry point `index.html` into it, and create a routes folder.
Thus, your file structure should look like this:

```
├── src
│   ├── app
│   │   ├── index.html
│   │   ├── routes
│   ├── pages                               # FSD Pages folder
```

Now, you can create routes for pages within `app` and connect pages from `pages` to them.

For example, to add a home page to your project, you need to do the following steps:

* Add a page slice inside the `pages` layer
* Add the corresponding rooute to the `routes` folder from the `app` layer
* Align the page from the slice with the rooute

To create a page slice, let's use the [CLI](https://github.com/feature-sliced/cli):

```
fsd pages home
```

Create a `home-page.svelte` file inside the ui segment, access it using the Public API

src/pages/home/index.ts

```
export { default as HomePage } from './ui/home-page.svelte';
```

Create a route for this page inside the `app` layer:

```
├── src
│   ├── app
│   │   ├── routes
│   │   │   ├── +page.svelte
│   │   ├── index.html
│   ├── pages
│   │   ├── home
│   │   │   ├── ui
│   │   │   │   ├── home-page.svelte
│   │   │   ├── index.ts
```

Add your page component inside the `+page.svelte` file:

src/app/routes/+page.svelte

```
<script>
  import { HomePage } from '@/pages/home';
</script>


<HomePage/>
```

## See also.[​](https://feature-sliced.design/docs/guides/tech/with-sveltekit.html#see-also "Direct link to heading")

* [Documentation on changing directory config in SvelteKit](https://kit.svelte.dev/docs/configuration#files)

[Previous

Usage with React Query](https://feature-sliced.design/docs/guides/tech/with-react-query.html)[Next

Desegemented](https://feature-sliced.design/docs/guides/issues/desegmented)

* [Let's set up the config](https://feature-sliced.design/docs/guides/tech/with-sveltekit.html#lets-set-up-the-config)* [Move file routing to `src/app`.](https://feature-sliced.design/docs/guides/tech/with-sveltekit.html#move-file-routing-to-srcapp)* [See also.](https://feature-sliced.design/docs/guides/tech/with-sveltekit.html#see-also)
