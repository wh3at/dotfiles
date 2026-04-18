---
title: "iOS & macOS Swift | Convex Developer Hub"
source_url: "https://docs.convex.dev/client/swift"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

The Convex Swift client library enables your iOS or macOS application to
interact with your Convex backend. It allows your frontend code to:

1. Call
   your [queries](https://docs.convex.dev/understanding/convex-fundamentals/functions.html), [mutations](https://docs.convex.dev/functions/mutation-functions.html) and [actions](https://docs.convex.dev/functions/actions.html)
2. Authenticate users using [Auth0](https://docs.convex.dev/auth/auth0.html)

The library is open source
and [available on GitHub](https://github.com/get-convex/convex-swift).

Follow the [Swift Quickstart](https://docs.convex.dev/quickstart/swift.html) to get started.

## Installation[​](https://docs.convex.dev/client/swift.html#installation "Direct link to Installation")

For an iOS or macOS project in Xcode, you’ll need to perform the following steps
to add a dependency on the `ConvexMobile` library.

1. Click on the top-level app container in the project navigator on the left
2. Click on the app name under the PROJECT heading
3. Click the *Package Dependencies* tab
4. Click the + button

   ![Screenshot 2024-10-02 at 2.33.43 PM.png](https://docs.convex.dev/assets/images/swift_qs_step_2-4edae92b06d29aba638512edc3fcc267.png)
5. Paste
   [`https://github.com/get-convex/convex-swift`](https://github.com/get-convex/convex-swift)
   into the search box and press Enter
6. When the `convex-swift` package loads, click the Add Package button
7. In the *Package Products* dialog, select your product name in the *Add to
   Target* dropdown
8. Click *Add Package*

## Connecting to a backend[​](https://docs.convex.dev/client/swift.html#connecting-to-a-backend "Direct link to Connecting to a backend")

The `ConvexClient` is used to establish and maintain a connection between your
application and the Convex backend. First you need to create an instance of the
client by giving it your backend deployment URL:

```
import ConvexMobile

let convex = ConvexClient(deploymentUrl: "https://<your domain here>.convex.cloud")
```

You should create and use one instance of the `ConvexClient` for the lifetime of
your application process. You can store the client in a global constant like
shown above. An actual connection to the Convex backend won’t be initiated until
you call a method on the `ConvexClient`. After that it will maintain the
connection and re-establish it if it gets dropped.

## Fetching data[​](https://docs.convex.dev/client/swift.html#fetching-data "Direct link to Fetching data")

The Swift Convex library gives you access to the Convex sync engine, which
enables real-time *subscriptions* to query results. You subscribe to queries
with the `subscribe` method on `ConvexClient` which returns
a [`Publisher`](https://developer.apple.com/documentation/combine). The data
available via the `Publisher` will change over time as the underlying data
backing the query changes.

You can call methods on the `Publisher` to transform and consume the data it
provides.

A simple way to consume a query that returns a list of strings in a `View` is to
use a combination of a `@State` containing a list and the `.task` modifier with
code that loops over the query results as an `AsyncSequence`:

```
struct ColorList: View {
  @State private var colors: [String] = []

  var body: some View {
    List {
      ForEach(colors, id: \.self) { color in
        Text(color)
      }
    }.task {
      let latestColors = convex.subscribe(to: "colors:get", yielding: [String].self)
        .replaceError(with: [])
        .values
      for await colors in latestColors {
        self.colors = colors
      }
    }
  }
}
```

Any time the data that powers the backend `"colors:get"` query changes, a
new array of `String` values will appear in the `AsyncSequence` and the
`View`'s `colors` list gets assigned the new data. The UI will then rebuild
reactively to reflect the changed data.

### Query arguments[​](https://docs.convex.dev/client/swift.html#query-arguments "Direct link to Query arguments")

You can pass arguments to `subscribe` and they will be supplied to the
associated backend `query` function. The arguments must be a Dictionary keyed
with strings and the values should generally be primitive types, Arrays and
other Dictionaries.

```
let publisher = convex.subscribe(to: "colors:get",
                               with:["onlyFavorites": true],
                           yielding:[String].self)
```

Assuming the `colors:get` query accepts an `onlyFavorites` argument, the value
can be received and used to perform logic in the query function.

tip

Use [Decodable structs](https://docs.convex.dev/client/swift/data-types.html#custom-data-types)
to automatically convert Convex objects to Swift structs.

caution

* There are important gotchas when
  [sending and receiving numbers](https://docs.convex.dev/client/swift/data-types.html#numerical-types)
  between Swift and Convex.
* Depending on your backend functions, you may need to deal with
  [reserved Swift keywords](https://docs.convex.dev/client/swift/data-types.html#field-name-conversion).

### Subscription lifetime[​](https://docs.convex.dev/client/swift.html#subscription-lifetime "Direct link to Subscription lifetime")

The `Publisher` returned from `subscribe` will persist as long as the associated
`View` or `ObservableObject`. When either is no longer part of the UI, the
underlying query subscription to Convex will be canceled.

## Editing Data[​](https://docs.convex.dev/client/swift.html#editing-data "Direct link to Editing Data")

You can use the `mutation` method on `ConvexClient` to trigger a
backend [mutation](https://docs.convex.dev/functions/mutation-functions.html).

`mutation` is an `async` method so you'll need to call it within a `Task`.
Mutations can return a value or not.

Mutations can also receive arguments, just like queries. Here's an example of
calling a mutation with arguments that returns a value:

```
let isColorAdded: Bool = try await convex.mutation("colors:put", with: ["color": newColor])
```

### Handling errors[​](https://docs.convex.dev/client/swift.html#handling-errors "Direct link to Handling errors")

If an error occurs during a call to `mutation`, it will throw. Typically you may
want to
catch [`ConvexError`](https://docs.convex.dev/functions/error-handling/application-errors.html) and `ServerError` and
handle them however is appropriate in your application.

Here’s a small example of how you might handle an error from `colors:put` if it
threw a `ConvexError` with an error message if a color already existed.

```
do {
  try await convex.mutation("colors:put", with: ["color": newColor])
} catch ClientError.ConvexError(let data) {
  errorMessage = try! JSONDecoder().decode(String.self, from: Data(data.utf8))
  colorNotAdded = true
}
```

See documentation on [error handling](https://docs.convex.dev/functions/error-handling/index.html) for more
details.

## Calling third-party APIs[​](https://docs.convex.dev/client/swift.html#calling-third-party-apis "Direct link to Calling third-party APIs")

You can use the `action` method on `ConvexClient` to trigger a
backend [action](https://docs.convex.dev/functions/actions.html).

Calls to `action` can accept arguments, return values and throw exceptions just
like calls to `mutation`.

Even though you can call actions from your client code, it's not always the
right choice. See the action docs for tips
on [calling actions from clients](https://docs.convex.dev/functions/actions.html#calling-actions-from-clients).

## Authentication with Auth0[​](https://docs.convex.dev/client/swift.html#authentication-with-auth0 "Direct link to Authentication with Auth0")

You can use `ConvexClientWithAuth` in place of `ConvexClient` to configure
authentication with [Auth0](https://auth0.com/). You'll need
the `convex-swift-auth0` library to do that, as well as an Auth0 account and
application configuration.

See
the [README](https://github.com/get-convex/convex-swift-auth0/blob/main/README.md) in
the `convex-swift-auth0` repo for more detailed setup instructions, and
the [Workout example app](https://github.com/get-convex/ios-convex-workout) which
is configured for Auth0. The overall [Convex authentication docs](https://docs.convex.dev/auth.html) are
a good resource as well.

It should also be possible to integrate other similar OpenID Connect
authentication providers. See
the [`AuthProvider`](https://github.com/get-convex/convex-swift/blob/c47aea414c92db2ccf3a0fa4f9db8caf2029b032/Sources/ConvexMobile/ConvexMobile.swift#L188) protocol
in the `convex-swift` repo for more info.

## Production and dev deployments[​](https://docs.convex.dev/client/swift.html#production-and-dev-deployments "Direct link to Production and dev deployments")

When you're ready to move toward [production](https://docs.convex.dev/production.html) for your app, you
can setup your Xcode build system to point different build targets to different
Convex deployments. Build environment configuration is highly specialized, and
it’s possible that you or your team have different conventions, but this is one
way to approach the problem.

1. Create “Dev” and “Prod” folders in your project sources.
2. Add an `Env.swift` file in each one with contents like:

```
let deploymentUrl = "https://$DEV_OR_PROD.convex.cloud"
```

3. Put your dev URL in `Dev/Env.swift` and your prod URL in `Prod/Env.swift`.
   Don’t worry if Xcode complains that `deploymentUrl` is defined multiple
   times.
4. Click on your top-level project in the explorer view on the left.
5. Select your build target from the **TARGETS** list.
6. Change the target’s name so it ends in “dev”.
7. Right/Ctrl-click it and duplicate it, giving it a name that ends in “prod”.
8. With the “dev” target selected, click the **Build Phases** tab.
9. Expand the **Compile Sources** section.
10. Select `Prod/Env.swift` and remove it with the - button.
11. Likewise, open the “prod” target and remove `Dev/Env.swift` from its
    sources.

![Screenshot 2024-10-03 at 1.34.34 PM.png](https://docs.convex.dev/assets/images/swift_env_setup-39f43c73bf9c8599957530a43582ca3d.png)

Now you can refer to `deploymentUrl` wherever you create your `ConvexClient` and
depending on the target that you build, it will use your dev or prod URL.

## Structuring your application[​](https://docs.convex.dev/client/swift.html#structuring-your-application "Direct link to Structuring your application")

The examples shown in this guide are intended to be brief, and don't provide
guidance on how to structure a whole application.

If you want a more robust and layered approach, put your code that interacts
with `ConvexClient`in a class that conforms to `ObservableObject`. Then your
`View` can observe that object as a `@StateObject` and will rebuild whenever it
changes.

For example, if we adapt the `colors:get` example from above to a
`ViewModel: ObservableObject` class, the `View` no longer plays a direct part in
fetching the data - it only knows that the list of `colors` is provided by the
`ViewModel`.

```
import SwiftUI

class ViewModel: ObservableObject {
  @Published var colors: [String] = []

  init() {
    convex.subscribe(to: "colors:get")
      .replaceError(with: [])
      .receive(on: DispatchQueue.main)
      .assign(to: &$colors)
  }
}

struct ContentView: View {
  @StateObject var viewModel = ViewModel()

  var body: some View {
    List {
      ForEach(viewModel.colors, id: \.self) { color in
        Text(color)
      }
    }
  }
}
```

Depending on your needs and the scale of your app, it might make sense to give
it even more formal structure as demonstrated in something like
<https://github.com/nalexn/clean-architecture-swiftui>.

## Under the hood[​](https://docs.convex.dev/client/swift.html#under-the-hood "Direct link to Under the hood")

The Swift Convex library is built on top of the
official [Convex Rust client](https://docs.convex.dev/client/rust.html). It handles maintaining a
WebSocket connection with the Convex backend and implements the full Convex
protocol.

All method calls on `ConvexClient` are handled via a Tokio async runtime on the
Rust side and are safe to call from the application's main actor.

[Previous

Python](https://docs.convex.dev/client/python.html)[Next

Data Types](https://docs.convex.dev/client/swift/data-types.html)

* [Installation](https://docs.convex.dev/client/swift.html#installation)
* [Connecting to a backend](https://docs.convex.dev/client/swift.html#connecting-to-a-backend)
* [Fetching data](https://docs.convex.dev/client/swift.html#fetching-data)
  + [Query arguments](https://docs.convex.dev/client/swift.html#query-arguments)
  + [Subscription lifetime](https://docs.convex.dev/client/swift.html#subscription-lifetime)
* [Editing Data](https://docs.convex.dev/client/swift.html#editing-data)
  + [Handling errors](https://docs.convex.dev/client/swift.html#handling-errors)
* [Calling third-party APIs](https://docs.convex.dev/client/swift.html#calling-third-party-apis)
* [Authentication with Auth0](https://docs.convex.dev/client/swift.html#authentication-with-auth0)
* [Production and dev deployments](https://docs.convex.dev/client/swift.html#production-and-dev-deployments)
* [Structuring your application](https://docs.convex.dev/client/swift.html#structuring-your-application)
* [Under the hood](https://docs.convex.dev/client/swift.html#under-the-hood)
