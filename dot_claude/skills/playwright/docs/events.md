---
title: "Events | Playwright"
source_url: "https://playwright.dev/docs/events"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * Guides* Events

On this page

## Introduction[​](https://playwright.dev/docs/events.html#introduction "Direct link to Introduction")

Playwright allows listening to various types of events happening on the web page, such as network requests, creation of child pages, dedicated workers etc. There are several ways to subscribe to such events, such as waiting for events or adding or removing event listeners.

## Waiting for event[​](https://playwright.dev/docs/events.html#waiting-for-event "Direct link to Waiting for event")

Most of the time, scripts will need to wait for a particular event to happen. Below are some of the typical event awaiting patterns.

Wait for a request with the specified url using [page.waitForRequest()](https://playwright.dev/docs/api/class-page.html#page-wait-for-request):

```
// Start waiting for request before goto. Note no await.
const requestPromise = page.waitForRequest('**/*logo*.png');
await page.goto('https://wikipedia.org');
const request = await requestPromise;
console.log(request.url());
```

Wait for popup window:

```
// Start waiting for popup before clicking. Note no await.
const popupPromise = page.waitForEvent('popup');
await page.getByText('open the popup').click();
const popup = await popupPromise;
await popup.goto('https://wikipedia.org');
```

## Adding/removing event listener[​](https://playwright.dev/docs/events.html#addingremoving-event-listener "Direct link to Adding/removing event listener")

Sometimes, events happen in random time and instead of waiting for them, they need to be handled. Playwright supports traditional language mechanisms for subscribing and unsubscribing from the events:

```
page.on('request', request => console.log(`Request sent: ${request.url()}`));
const listener = request => console.log(`Request finished: ${request.url()}`);
page.on('requestfinished', listener);
await page.goto('https://wikipedia.org');

page.off('requestfinished', listener);
await page.goto('https://www.openstreetmap.org/');
```

## Adding one-off listeners[​](https://playwright.dev/docs/events.html#adding-one-off-listeners "Direct link to Adding one-off listeners")

If a certain event needs to be handled once, there is a convenience API for that:

```
page.once('dialog', dialog => dialog.accept('2021'));
await page.evaluate("prompt('Enter a number:')");
```

[Previous

Evaluating JavaScript](https://playwright.dev/docs/evaluating.html)[Next

Extensibility](https://playwright.dev/docs/extensibility.html)

* [Introduction](https://playwright.dev/docs/events.html#introduction)* [Waiting for event](https://playwright.dev/docs/events.html#waiting-for-event)* [Adding/removing event listener](https://playwright.dev/docs/events.html#addingremoving-event-listener)* [Adding one-off listeners](https://playwright.dev/docs/events.html#adding-one-off-listeners)
