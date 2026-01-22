---
title: "Usage with Electron | Feature-Sliced Design"
source_url: "https://feature-sliced.design/docs/guides/tech/with-electron"
fetched_at: "2025-12-24T01:59:28.495697+00:00"
---



* * 🎯 Guides* Tech* Usage with Electron

On this page

Electron applications have a special architecture consisting of multiple processes with different responsibilities. Applying FSD in such a context requires adapting the structure to the Electron specifics.

```
└── src
    ├── app                                 # Common app layer
    │   ├── main                            # Main process
    │   │   └── index.ts                    # Main process entry point
    │   ├── preload                         # Preload script and Context Bridge
    │   │   └── index.ts                    # Preload entry point
    │   └── renderer                        # Renderer process
    │       └── index.html                  # Renderer process entry point
    ├── main
    │   ├── features
    │   │   └── user
    │   │       └── ipc
    │   │           ├── get-user.ts
    │   │           └── send-user.ts
    │   ├── entities
    │   └── shared
    ├── renderer
    │   ├── pages
    │   │   ├── settings
    │   │   │   ├── ipc
    │   │   │   │   ├── get-user.ts
    │   │   │   │   └── save-user.ts
    │   │   │   ├── ui
    │   │   │   │   └── user.tsx
    │   │   │   └── index.ts
    │   │   └── home
    │   │       ├── ui
    │   │       │   └── home.tsx
    │   │       └── index.ts
    │   ├── widgets
    │   ├── features
    │   ├── entities
    │   └── shared
    └── shared                              # Common code between main and renderer
        └── ipc                             # IPC description (event names, contracts)
```

## Public API rules[​](https://feature-sliced.design/docs/guides/tech/with-electron.html#public-api-rules "Direct link to heading")

Each process must have its own public API. For example, you can't import modules from `main` to `renderer`.
Only the `src/shared` folder is public for both processes.
It's also necessary for describing contracts for process interaction.

## Additional changes to the standard structure[​](https://feature-sliced.design/docs/guides/tech/with-electron.html#additional-changes-to-the-standard-structure "Direct link to heading")

It's suggested to use a new `ipc` segment, where interaction between processes takes place.
The `pages` and `widgets` layers, based on their names, should not be present in `src/main`. You can use `features`, `entities` and `shared`.
The `app` layer in `src` contains entry points for `main` and `renderer`, as well as the IPC.
It's not desirable for segments in the `app` layer to have intersection points

## Interaction example[​](https://feature-sliced.design/docs/guides/tech/with-electron.html#interaction-example "Direct link to heading")

src/shared/ipc/channels.ts

```
export const CHANNELS = {
    GET_USER_DATA: 'GET_USER_DATA',
    SAVE_USER: 'SAVE_USER',
} as const;

export type TChannelKeys = keyof typeof CHANNELS;
```

src/shared/ipc/events.ts

```
import { CHANNELS } from './channels';

export interface IEvents {
    [CHANNELS.GET_USER_DATA]: {
        args: void,
        response?: { name: string; email: string; };
    };
    [CHANNELS.SAVE_USER]: {
        args: { name: string; };
        response: void;
    };
}
```

src/shared/ipc/preload.ts

```
import { CHANNELS } from './channels';
import type { IEvents } from './events';

type TOptionalArgs<T> = T extends void ? [] : [args: T];

export type TElectronAPI = {
    [K in keyof typeof CHANNELS]: (...args: TOptionalArgs<IEvents[typeof CHANNELS[K]]['args']>) => IEvents[typeof CHANNELS[K]]['response'];
};
```

src/app/preload/index.ts

```
import { contextBridge, ipcRenderer } from 'electron';
import { CHANNELS, type TElectronAPI } from 'shared/ipc';

const API: TElectronAPI = {
    [CHANNELS.GET_USER_DATA]: () => ipcRenderer.sendSync(CHANNELS.GET_USER_DATA),
    [CHANNELS.SAVE_USER]: args => ipcRenderer.invoke(CHANNELS.SAVE_USER, args),
} as const;

contextBridge.exposeInMainWorld('electron', API);
```

src/main/features/user/ipc/send-user.ts

```
import { ipcMain } from 'electron';
import { CHANNELS } from 'shared/ipc';

export const sendUser = () => {
    ipcMain.on(CHANNELS.GET_USER_DATA, ev => {
        ev.returnValue = {
            name: 'John Doe',
            email: 'john.doe@example.com',
        };
    });
};
```

src/renderer/pages/user-settings/ipc/get-user.ts

```
import { CHANNELS } from 'shared/ipc';

export const getUser = () => {
    const user = window.electron[CHANNELS.GET_USER_DATA]();

    return user ?? { name: 'John Donte', email: 'john.donte@example.com' };
};
```

## See also[​](https://feature-sliced.design/docs/guides/tech/with-electron.html#see-also "Direct link to heading")

* [Process Model Documentation](https://www.electronjs.org/docs/latest/tutorial/process-model)
* [Context Isolation Documentation](https://www.electronjs.org/docs/latest/tutorial/context-isolation)
* [Inter-Process Communication Documentation](https://www.electronjs.org/docs/latest/tutorial/ipc)
* [Example](https://github.com/feature-sliced/examples/tree/master/examples/electron)

[Previous

Usage with Next.js](https://feature-sliced.design/docs/guides/tech/with-nextjs.tmp.html)[Next

Usage with NuxtJS](https://feature-sliced.design/docs/guides/tech/with-nuxtjs)

* [Public API rules](https://feature-sliced.design/docs/guides/tech/with-electron.html#public-api-rules)* [Additional changes to the standard structure](https://feature-sliced.design/docs/guides/tech/with-electron.html#additional-changes-to-the-standard-structure)* [Interaction example](https://feature-sliced.design/docs/guides/tech/with-electron.html#interaction-example)* [See also](https://feature-sliced.design/docs/guides/tech/with-electron.html#see-also)
