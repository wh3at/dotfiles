---
title: "Handles | Playwright"
source_url: "https://playwright.dev/docs/handles"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * Guides* Handles

On this page

## Introduction[​](https://playwright.dev/docs/handles.html#introduction "Direct link to Introduction")

Playwright can create handles to the page DOM elements or any other objects inside the page. These handles live in the Playwright process, whereas the actual objects live in the browser. There are two types of handles:

* [JSHandle](https://playwright.dev/docs/api/class-jshandle.html "JSHandle") to reference any JavaScript objects in the page
* [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle") to reference DOM elements in the page, it has extra methods that allow performing actions on the elements and asserting their properties.

Since any DOM element in the page is also a JavaScript object, any [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle") is a [JSHandle](https://playwright.dev/docs/api/class-jshandle.html "JSHandle") as well.

Handles are used to perform operations on those actual objects in the page. You can evaluate on a handle, get handle properties, pass handle as an evaluation parameter, serialize page object into JSON etc. See the [JSHandle](https://playwright.dev/docs/api/class-jshandle.html "JSHandle") class API for these and methods.

### API reference[​](https://playwright.dev/docs/handles.html#api-reference "Direct link to API reference")

* [JSHandle](https://playwright.dev/docs/api/class-jshandle.html "JSHandle")
* [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle")

Here is the easiest way to obtain a [JSHandle](https://playwright.dev/docs/api/class-jshandle.html "JSHandle").

```
const jsHandle = await page.evaluateHandle('window');
//  Use jsHandle for evaluations.
```

## Element Handles[​](https://playwright.dev/docs/handles.html#element-handles "Direct link to Element Handles")

Discouraged

The use of [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle") is discouraged, use [Locator](https://playwright.dev/docs/api/class-locator.html "Locator") objects and web-first assertions instead.

When [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle") is required, it is recommended to fetch it with the [page.waitForSelector()](https://playwright.dev/docs/api/class-page.html#page-wait-for-selector) or [frame.waitForSelector()](https://playwright.dev/docs/api/class-frame.html#frame-wait-for-selector) methods. These APIs wait for the element to be attached and visible.

```
// Get the element handle
const elementHandle = page.waitForSelector('#box');

// Assert bounding box for the element
const boundingBox = await elementHandle.boundingBox();
expect(boundingBox.width).toBe(100);

// Assert attribute for the element
const classNames = await elementHandle.getAttribute('class');
expect(classNames.includes('highlighted')).toBeTruthy();
```

## Handles as parameters[​](https://playwright.dev/docs/handles.html#handles-as-parameters "Direct link to Handles as parameters")

Handles can be passed into the [page.evaluate()](https://playwright.dev/docs/api/class-page.html#page-evaluate) and similar methods. The following snippet creates a new array in the page, initializes it with data and returns a handle to this array into Playwright. It then uses the handle in subsequent evaluations:

```
// Create new array in page.
const myArrayHandle = await page.evaluateHandle(() => {
  window.myArray = [1];
  return myArray;
});

// Get the length of the array.
const length = await page.evaluate(a => a.length, myArrayHandle);

// Add one more element to the array using the handle
await page.evaluate(arg => arg.myArray.push(arg.newElement), {
  myArray: myArrayHandle,
  newElement: 2
});

// Release the object when it's no longer needed.
await myArrayHandle.dispose();
```

## Handle Lifecycle[​](https://playwright.dev/docs/handles.html#handle-lifecycle "Direct link to Handle Lifecycle")

Handles can be acquired using the page methods such as [page.evaluateHandle()](https://playwright.dev/docs/api/class-page.html#page-evaluate-handle), [page.$()](https://playwright.dev/docs/api/class-page.html#page-query-selector) or [page.$$()](https://playwright.dev/docs/api/class-page.html#page-query-selector-all) or their frame counterparts [frame.evaluateHandle()](https://playwright.dev/docs/api/class-frame.html#frame-evaluate-handle), [frame.$()](https://playwright.dev/docs/api/class-frame.html#frame-query-selector) or [frame.$$()](https://playwright.dev/docs/api/class-frame.html#frame-query-selector-all). Once created, handles will retain object from [garbage collection](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_Management) unless page navigates or the handle is manually disposed via the [jsHandle.dispose()](https://playwright.dev/docs/api/class-jshandle.html#js-handle-dispose) method.

### API reference[​](https://playwright.dev/docs/handles.html#api-reference-1 "Direct link to API reference")

* [JSHandle](https://playwright.dev/docs/api/class-jshandle.html "JSHandle")
* [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle")
* [elementHandle.boundingBox()](https://playwright.dev/docs/api/class-elementhandle.html#element-handle-bounding-box)
* [elementHandle.getAttribute()](https://playwright.dev/docs/api/class-elementhandle.html#element-handle-get-attribute)
* [elementHandle.innerText()](https://playwright.dev/docs/api/class-elementhandle.html#element-handle-inner-text)
* [elementHandle.innerHTML()](https://playwright.dev/docs/api/class-elementhandle.html#element-handle-inner-html)
* [elementHandle.textContent()](https://playwright.dev/docs/api/class-elementhandle.html#element-handle-text-content)
* [jsHandle.evaluate()](https://playwright.dev/docs/api/class-jshandle.html#js-handle-evaluate)
* [page.evaluateHandle()](https://playwright.dev/docs/api/class-page.html#page-evaluate-handle)
* [page.$()](https://playwright.dev/docs/api/class-page.html#page-query-selector)
* [page.$$()](https://playwright.dev/docs/api/class-page.html#page-query-selector-all)

## Locator vs ElementHandle[​](https://playwright.dev/docs/handles.html#locator-vs-elementhandle "Direct link to Locator vs ElementHandle")

caution

We only recommend using [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle") in the rare cases when you need to perform extensive DOM traversal on a static page. For all user actions and assertions use locator instead.

The difference between the [Locator](https://playwright.dev/docs/api/class-locator.html "Locator") and [ElementHandle](https://playwright.dev/docs/api/class-elementhandle.html "ElementHandle") is that the latter points to a particular element, while Locator captures the logic of how to retrieve that element.

In the example below, handle points to a particular DOM element on page. If that element changes text or is used by React to render an entirely different component, handle is still pointing to that very stale DOM element. This can lead to unexpected behaviors.

```
const handle = await page.$('text=Submit');
// ...
await handle.hover();
await handle.click();
```

With the locator, every time the locator is used, up-to-date DOM element is located in the page using the selector. So in the snippet below, underlying DOM element is going to be located twice.

```
const locator = page.getByText('Submit');
// ...
await locator.hover();
await locator.click();
```

[Previous

Frames](https://playwright.dev/docs/frames.html)[Next

Isolation](https://playwright.dev/docs/browser-contexts.html)

* [Introduction](https://playwright.dev/docs/handles.html#introduction)
  + [API reference](https://playwright.dev/docs/handles.html#api-reference)* [Element Handles](https://playwright.dev/docs/handles.html#element-handles)* [Handles as parameters](https://playwright.dev/docs/handles.html#handles-as-parameters)* [Handle Lifecycle](https://playwright.dev/docs/handles.html#handle-lifecycle)
        + [API reference](https://playwright.dev/docs/handles.html#api-reference-1)* [Locator vs ElementHandle](https://playwright.dev/docs/handles.html#locator-vs-elementhandle)
