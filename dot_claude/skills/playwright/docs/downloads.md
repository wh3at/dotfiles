---
title: "Downloads | Playwright"
source_url: "https://playwright.dev/docs/downloads"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * Guides* Downloads

On this page

## Introduction[​](https://playwright.dev/docs/downloads.html#introduction "Direct link to Introduction")

For every attachment downloaded by the page, [page.on('download')](https://playwright.dev/docs/api/class-page.html#page-event-download) event is emitted. All these attachments are downloaded into a temporary folder. You can obtain the download url, file name and payload stream using the [Download](https://playwright.dev/docs/api/class-download.html "Download") object from the event.

You can specify where to persist downloaded files using the [downloadsPath](https://playwright.dev/docs/api/class-browsertype.html#browser-type-launch-option-downloads-path) option in [browserType.launch()](https://playwright.dev/docs/api/class-browsertype.html#browser-type-launch).

note

Downloaded files are deleted when the browser context that produced them is closed.

Here is the simplest way to handle the file download:

```
// Start waiting for download before clicking. Note no await.
const downloadPromise = page.waitForEvent('download');
await page.getByText('Download file').click();
const download = await downloadPromise;

// Wait for the download process to complete and save the downloaded file somewhere.
await download.saveAs('/path/to/save/at/' + download.suggestedFilename());
```

#### Variations[​](https://playwright.dev/docs/downloads.html#variations "Direct link to Variations")

If you have no idea what initiates the download, you can still handle the event:

```
page.on('download', download => download.path().then(console.log));
```

Note that handling the event forks the control flow and makes the script harder to follow. Your scenario might end while you are downloading a file since your main control flow is not awaiting for this operation to resolve.

note

For uploading files, see the [uploading files](https://playwright.dev/docs/input.html#upload-files) section.

[Previous

Dialogs](https://playwright.dev/docs/dialogs.html)[Next

Evaluating JavaScript](https://playwright.dev/docs/evaluating.html)

* [Introduction](https://playwright.dev/docs/downloads.html#introduction)
