---
title: "AndroidSocket | Playwright"
source_url: "https://playwright.dev/docs/api/class-androidsocket"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Experimental* AndroidSocket

On this page

[AndroidSocket](https://playwright.dev/docs/api/class-androidsocket.html "AndroidSocket") is a way to communicate with a process launched on the [AndroidDevice](https://playwright.dev/docs/api/class-androiddevice.html "AndroidDevice"). Use [androidDevice.open()](https://playwright.dev/docs/api/class-androiddevice.html#android-device-open) to open a socket.

---

## Methods[​](https://playwright.dev/docs/api/class-androidsocket.html#methods "Direct link to Methods")

### close[​](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-close "Direct link to close")

Added in: v1.9
androidSocket.close

Closes the socket.

**Usage**

```
await androidSocket.close();
```

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-close-return)

---

### write[​](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-write "Direct link to write")

Added in: v1.9
androidSocket.write

Writes some [data](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-write-option-data) to the socket.

**Usage**

```
await androidSocket.write(data);
```

**Arguments**

* `data` [Buffer](https://nodejs.org/api/buffer.html#buffer_class_buffer "Buffer")[#](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-write-option-data)

  Data to write.

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-write-return)

---

## Events[​](https://playwright.dev/docs/api/class-androidsocket.html#events "Direct link to Events")

### on('close')[​](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-event-close "Direct link to on('close')")

Added in: v1.9
androidSocket.on('close')

Emitted when the socket is closed.

**Usage**

```
androidSocket.on('close', data => {});
```

---

### on('data')[​](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-event-data "Direct link to on('data')")

Added in: v1.9
androidSocket.on('data')

Emitted when data is available to read from the socket.

**Usage**

```
androidSocket.on('data', data => {});
```

**Event data**

* [Buffer](https://nodejs.org/api/buffer.html#buffer_class_buffer "Buffer")

[Previous

AndroidInput](https://playwright.dev/docs/api/class-androidinput.html)[Next

AndroidWebView](https://playwright.dev/docs/api/class-androidwebview.html)

* [Methods](https://playwright.dev/docs/api/class-androidsocket.html#methods)
  + [close](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-close)+ [write](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-write)* [Events](https://playwright.dev/docs/api/class-androidsocket.html#events)
    + [on('close')](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-event-close)+ [on('data')](https://playwright.dev/docs/api/class-androidsocket.html#android-socket-event-data)
