---
title: "Video | Playwright"
source_url: "https://playwright.dev/docs/api/class-video"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* Video

On this page

When browser context is created with the `recordVideo` option, each page has a video object associated with it.

```
console.log(await page.video().path());
```

---

## Methods[​](https://playwright.dev/docs/api/class-video.html#methods "Direct link to Methods")

### delete[​](https://playwright.dev/docs/api/class-video.html#video-delete "Direct link to delete")

Added in: v1.11
video.delete

Deletes the video file. Will wait for the video to finish if necessary.

**Usage**

```
await video.delete();
```

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-video.html#video-delete-return)

---

### path[​](https://playwright.dev/docs/api/class-video.html#video-path "Direct link to path")

Added before v1.9
video.path

Returns the file system path this video will be recorded to. The video is guaranteed to be written to the filesystem upon closing the browser context. This method throws when connected remotely.

**Usage**

```
await video.path();
```

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")>[#](https://playwright.dev/docs/api/class-video.html#video-path-return)

---

### saveAs[​](https://playwright.dev/docs/api/class-video.html#video-save-as "Direct link to saveAs")

Added in: v1.11
video.saveAs

Saves the video to a user-specified path. It is safe to call this method while the video is still in progress, or after the page has closed. This method waits until the page is closed and the video is fully saved.

**Usage**

```
await video.saveAs(path);
```

**Arguments**

* `path` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")[#](https://playwright.dev/docs/api/class-video.html#video-save-as-option-path)

  Path where the video should be saved.

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-video.html#video-save-as-return)

[Previous

Tracing](https://playwright.dev/docs/api/class-tracing.html)[Next

WebError](https://playwright.dev/docs/api/class-weberror.html)

* [Methods](https://playwright.dev/docs/api/class-video.html#methods)
  + [delete](https://playwright.dev/docs/api/class-video.html#video-delete)+ [path](https://playwright.dev/docs/api/class-video.html#video-path)+ [saveAs](https://playwright.dev/docs/api/class-video.html#video-save-as)
