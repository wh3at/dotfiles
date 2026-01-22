---
title: "Usage with Next.js | Feature-Sliced Design"
source_url: "https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp"
fetched_at: "2025-12-24T01:59:28.495697+00:00"
---



* * 🎯 Guides* Tech* Usage with Next.js

On this page

FSD is compatible with Next.js in both the App Router version and the Pages Router version if you solve the main conflict — the `app` and `pages` folders.

## App Router[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#app-router "Direct link to heading")

### Conflict between FSD and Next.js in the `app` layer[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#conflict-between-fsd-and-nextjs-in-the-app-layer "Direct link to heading")

Next.js suggests using the `app` folder to define application routes. It expects files in the `app` folder to correspond to pathnames. This routing mechanism **does not align** with the FSD concept, as it's not possible to maintain a flat slice structure.

The solution is to move the Next.js `app` folder to the project root and import FSD pages from `src`, where the FSD layers are, into the Next.js `app` folder.

You will also need to add a `pages` folder to the project root, otherwise Next.js will try to use `src/pages` as the Pages Router even if you use the App Router, which will break the build. It's also a good idea to put a `README.md` file inside this root `pages` folder describing why it is necessary, even though it's empty.

```
├── app                              # App folder (Next.js)
│   ├── api
│   │   └── get-example
│   │       └── route.ts
│   └── example
│       └── page.tsx
├── pages                            # Empty pages folder (Next.js)
│   └── README.md
└── src
    ├── app
    │   └── api-routes               # API routes
    ├── pages
    │   └── example
    │       ├── index.ts
    │       └── ui
    │           └── example.tsx
    ├── widgets
    ├── features
    ├── entities
    └── shared
```

Example of re-exporting a page from `src/pages` in the Next.js `app`:

app/example/page.tsx

```
export { ExamplePage as default, metadata } from '@/pages/example';
```

### Middleware[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#middleware "Direct link to heading")

If you use middleware in your project, it must be located in the project root alongside the Next.js `app` and `pages` folders.

### Instrumentation[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#instrumentation "Direct link to heading")

The `instrumentation.js` file allows you to monitor the performance and behavior of your application. If you use it, it must be located in the project root, similar to `middleware.js`.

## Pages Router[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#pages-router "Direct link to heading")

### Conflict between FSD and Next.js in the `pages` layer[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#conflict-between-fsd-and-nextjs-in-the-pages-layer "Direct link to heading")

Routes should be placed in the `pages` folder in the root of the project, similar to `app` folder for the App Router. The structure inside `src` where the layer folders are located remains unchanged.

```
├── pages                            # Pages folder (Next.js)
│   ├── _app.tsx
│   ├── api
│   │   └── example.ts               # API route re-export
│   └── example
│       └── index.tsx
└── src
    ├── app
    │   ├── custom-app
    │   │   └── custom-app.tsx       # Custom App component
    │   └── api-routes
    │       └── get-example-data.ts  # API route
    ├── pages
    │   └── example
    │       ├── index.ts
    │       └── ui
    │           └── example.tsx
    ├── widgets
    ├── features
    ├── entities
    └── shared
```

Example of re-exporting a page from `src/pages` in the Next.js `pages`:

pages/example/index.tsx

```
export { Example as default } from '@/pages/example';
```

### Custom `_app` component[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#custom-_app-component "Direct link to heading")

You can place your Custom App component in `src/app/_app` or `src/app/custom-app`:

src/app/custom-app/custom-app.tsx

```
import type { AppProps } from 'next/app';

export const MyApp = ({ Component, pageProps }: AppProps) => {
    return (
        <>
            <p>My Custom App component</p>
            <Component { ...pageProps } />
        </>
    );
};
```

pages/\_app.tsx

```
export { App as default } from '@/app/custom-app';
```

## Route Handlers (API routes)[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#route-handlers-api-routes "Direct link to heading")

Use the `api-routes` segment in the `app` layer to work with Route Handlers.

Be mindful when writing backend code in the FSD structure — FSD is primarily intended for frontends, meaning that's what people will expect to find.
If you need a lot of endpoints, consider separating them into a different package in a monorepo.

* App Router* Pages Router

src/app/api-routes/get-example-data.ts

```
import { getExamplesList } from '@/shared/db';

export const getExampleData = () => {
    try {
        const examplesList = getExamplesList();

        return Response.json({ examplesList });
    } catch {
        return Response.json(null, {
            status: 500,
            statusText: 'Ouch, something went wrong',
        });
    }
};
```

app/api/example/route.ts

```
export { getExampleData as GET } from '@/app/api-routes';
```

src/app/api-routes/get-example-data.ts

```
import type { NextApiRequest, NextApiResponse } from 'next';

const config = {
    api: {
        bodyParser: {
            sizeLimit: '1mb',
        },
    },
    maxDuration: 5,
};

const handler = (req: NextApiRequest, res: NextApiResponse<ResponseData>) => {
    res.status(200).json({ message: 'Hello from FSD' });
};

export const getExampleData = { config, handler } as const;
```

src/app/api-routes/index.ts

```
export { getExampleData } from './get-example-data';
```

app/api/example.ts

```
import { getExampleData } from '@/app/api-routes';

export const config = getExampleData.config;
export default getExampleData.handler;
```

## Additional recommendations[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#additional-recommendations "Direct link to heading")

* Use the `db` segment in the `shared` layer to describe database queries and their further use in higher layers.
* Caching and revalidating queries logic is better kept in the same place as the queries themselves.

## See also[​](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#see-also "Direct link to heading")

* [Next.js Project Structure](https://nextjs.org/docs/app/getting-started/project-structure)
* [Next.js Page Layouts](https://nextjs.org/docs/app/getting-started/layouts-and-pages)

[Previous

Migration from v2.0 to v2.1](https://feature-sliced.design/docs/guides/migration/from-v2-0)[Next

Usage with Electron](https://feature-sliced.design/docs/guides/tech/with-electron.html)

* [App Router](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#app-router)
  + [Conflict between FSD and Next.js in the `app` layer](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#conflict-between-fsd-and-nextjs-in-the-app-layer)+ [Middleware](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#middleware)+ [Instrumentation](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#instrumentation)* [Pages Router](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#pages-router)
    + [Conflict between FSD and Next.js in the `pages` layer](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#conflict-between-fsd-and-nextjs-in-the-pages-layer)+ [Custom `_app` component](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#custom-_app-component)* [Route Handlers (API routes)](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#route-handlers-api-routes)* [Additional recommendations](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#additional-recommendations)* [See also](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html#see-also)
