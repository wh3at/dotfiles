---
title: "FileChooser | Playwright"
source_url: "https://playwright.dev/docs/api/class-filechooser"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* FileChooser

On this page

[FileChooser](https://playwright.dev/docs/api/class-filechooser.html "FileChooser") objects are dispatched by the page in the [page.on('filechooser')](https://playwright.dev/docs/api/class-page.html#page-event-file-chooser) event.

```
// Start waiting for file chooser before clicking. Note no await.
const fileChooserPromise = page.waitForEvent('filechooser');
await page.getByText('Upload file').click();
const fileChooser = await fileChooserPromise;
await fileChooser.setFiles(path.join(__dirname, 'myfile.pdf'));
```

---

## Methods[​](https://playwright.dev/docs/api/class-filechooser.html#methods "Direct link to Methods")

### element[​](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-element "Direct link to element")

Added before v1.9
fileChooser.element

Returns input element associated with this file chooser.

**Usage**

```
fileChooser.element();
```

**Returns**

* [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle")[#](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-element-return)

---

### isMultiple[​](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-is-multiple "Direct link to isMultiple")

Added before v1.9
fileChooser.isMultiple

Returns whether this file chooser accepts multiple files.

**Usage**

```
fileChooser.isMultiple();
```

**Returns**

* [boolean](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Boolean_type "Boolean")[#](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-is-multiple-return)

---

### page[​](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-page "Direct link to page")

Added before v1.9
fileChooser.page

Returns page this file chooser belongs to.

**Usage**

```
fileChooser.page();
```

**Returns**

* [Page](https://playwright.dev/docs/api/class-page.html "Page")[#](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-page-return)

---

### setFiles[​](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-set-files "Direct link to setFiles")

Added before v1.9
fileChooser.setFiles

Sets the value of the file input this chooser is associated with. If some of the `filePaths` are relative paths, then they are resolved relative to the current working directory. For empty array, clears the selected files.

**Usage**

```
await fileChooser.setFiles(files);
await fileChooser.setFiles(files, options);
```

**Arguments**

* `files` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") | [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")> | [Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object") | [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object")>[#](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-set-files-option-files)
  + `name` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

    File name
  + `mimeType` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

    File type
  + `buffer` [Buffer](https://nodejs.org/api/buffer.html#buffer_class_buffer "Buffer")

    File content
* `options` [Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object") *(optional)*
  + `noWaitAfter` [boolean](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Boolean_type "Boolean") *(optional)*[#](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-set-files-option-no-wait-after)

    Deprecated

    This option has no effect.

    This option has no effect.
  + `timeout` [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number") *(optional)*[#](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-set-files-option-timeout)

    Maximum time in milliseconds. Defaults to `0` - no timeout. The default value can be changed via `actionTimeout` option in the config, or by using the [browserContext.setDefaultTimeout()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-set-default-timeout) or [page.setDefaultTimeout()](https://playwright.dev/docs/api/class-page.html#page-set-default-timeout) methods.

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-set-files-return)

[Previous

ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html)[Next

Frame](https://playwright.dev/docs/api/class-frame.html)

* [Methods](https://playwright.dev/docs/api/class-filechooser.html#methods)
  + [element](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-element)+ [isMultiple](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-is-multiple)+ [page](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-page)+ [setFiles](https://playwright.dev/docs/api/class-filechooser.html#file-chooser-set-files)
