---
title: "Slices and segments | Feature-Sliced Design"
source_url: "https://feature-sliced.design/docs/reference/slices-segments"
fetched_at: "2025-12-24T02:00:39.148671+00:00"
---



* * 📚 Reference* Slices and segments

On this page

## Slices[​](https://feature-sliced.design/docs/reference/slices-segments.html#slices "Direct link to heading")

Slices are the second level in the organizational hierarchy of Feature-Sliced Design. Their main purpose is to group code by its meaning for the product, business, or just the application.

The names of slices are not standardized because they are directly determined by the business domain of your application. For example, a photo gallery might have slices `photo`, `effects`, `gallery-page`. A social network would require different slices, for example, `post`, `comments`, `news-feed`.

The layers Shared and App don't contain slices. That is because Shared should contain no business logic at all, hence has no meaning for the product, and App should contain only code that concerns the entire application, so no splitting is necessary.

### Zero coupling and high cohesion[​](https://feature-sliced.design/docs/reference/slices-segments.html#zero-coupling-high-cohesion "Direct link to heading")

Slices are meant to be independent and highly cohesive groups of code files. The graphic below might help to visualize the tricky concepts of *cohesion* and *coupling*:

![](https://feature-sliced.design/img/coupling-cohesion-light.svg#light-mode-only)![](https://feature-sliced.design/img/coupling-cohesion-dark.svg#dark-mode-only)

Image inspired by <https://enterprisecraftsmanship.com/posts/cohesion-coupling-difference/>

An ideal slice is independent from other slices on its layer (zero coupling) and contains most of the code related to its primary goal (high cohesion).

The independence of slices is enforced by the [import rule on layers](https://feature-sliced.design/docs/reference/layers.html#import-rule-on-layers):

> *A module (file) in a slice can only import other slices when they are located on layers strictly below.*

### Public API rule on slices[​](https://feature-sliced.design/docs/reference/slices-segments.html#public-api-rule-on-slices "Direct link to heading")

Inside a slice, the code could be organized in any way that you want. That doesn't pose any issues as long as the slice provides a good public API for other slices to use it. This is enforced with the **public API rule on slices**:

> *Every slice (and segment on layers that don't have slices) must contain a public API definition.*
>
> *Modules outside of this slice/segment can only reference the public API, not the internal file structure of the slice/segment.*

Read more about the rationale of public APIs and the best practices on creating one in the [Public API reference](https://feature-sliced.design/docs/reference/public-api.html).

### Slice groups[​](https://feature-sliced.design/docs/reference/slices-segments.html#slice-groups "Direct link to heading")

Closely related slices can be structurally grouped in a folder, but they should exercise the same isolation rules as other slices — there should be **no code sharing** in that folder.

![Features &quot;compose&quot;, &quot;like&quot; and &quot;delete&quot; grouped in a folder &quot;post&quot;. In that folder there is also a file &quot;some-shared-code.ts&quot; that is crossed out to imply that it&#39;s not allowed.](https://feature-sliced.design/assets/images/graphic-nested-slices-b9c44e6cc55ecdbf3e50bf40a61e5a27.svg)

## Segments[​](https://feature-sliced.design/docs/reference/slices-segments.html#segments "Direct link to heading")

Segments are the third and final level in the organizational hierarchy, and their purpose is to group code by its technical nature.

There a few standardized segment names:

* `ui` — everything related to UI display: UI components, date formatters, styles, etc.
* `api` — backend interactions: request functions, data types, mappers, etc.
* `model` — the data model: schemas, interfaces, stores, and business logic.
* `lib` — library code that other modules on this slice need.
* `config` — configuration files and feature flags.

See the [Layers page](https://feature-sliced.design/docs/reference/layers.html#layer-definitions) for examples of what each of these segments might be used for on different layers.

You can also create custom segments. The most common places for custom segments are the App layer and the Shared layer, where slices don't make sense.

Make sure that the name of these segments describes the purpose of the content, not its essence. For example, `components`, `hooks`, and `types` are bad segment names because they aren't that helpful when you're looking for code.

[Previous

Layers](https://feature-sliced.design/docs/reference/layers.html)[Next

Public API](https://feature-sliced.design/docs/reference/public-api.html)

* [Slices](https://feature-sliced.design/docs/reference/slices-segments.html#slices)
  + [Zero coupling and high cohesion](https://feature-sliced.design/docs/reference/slices-segments.html#zero-coupling-high-cohesion)+ [Public API rule on slices](https://feature-sliced.design/docs/reference/slices-segments.html#public-api-rule-on-slices)+ [Slice groups](https://feature-sliced.design/docs/reference/slices-segments.html#slice-groups)* [Segments](https://feature-sliced.design/docs/reference/slices-segments.html#segments)
