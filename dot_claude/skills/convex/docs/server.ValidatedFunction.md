---
title: "Interface: ValidatedFunction<Ctx, ArgsValidator, Returns> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.ValidatedFunction"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* ValidatedFunction

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).ValidatedFunction

**`Deprecated`**

-- See the type definition for `MutationBuilder` or similar for
the types used for defining Convex functions.

The definition of a Convex query, mutation, or action function with argument
validation.

Argument validation allows you to assert that the arguments to this function
are the expected type.

Example:

```
import { query } from "./_generated/server";
import { v } from "convex/values";

export const func = query({
  args: {
    arg: v.string()
  },
  handler: ({ db }, { arg }) => {...},
});
```

**For security, argument validation should be added to all public functions in
production apps.**

See [UnvalidatedFunction](https://docs.convex.dev/api/modules/server.html#unvalidatedfunction) for functions without argument validation.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Ctx` | `Ctx` |
| `ArgsValidator` | extends [`PropertyValidators`](https://docs.convex.dev/api/modules/values.html#propertyvalidators) |
| `Returns` | `Returns` |

## Properties[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#properties "Direct link to Properties")

### args[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#args "Direct link to args")

• **args**: `ArgsValidator`

A validator for the arguments of this function.

This is an object mapping argument names to validators constructed with
[v](https://docs.convex.dev/api/modules/values.html#v).

```
import { v } from "convex/values";

const args = {
  stringArg: v.string(),
  optionalNumberArg: v.optional(v.number()),
}
```

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#defined-in "Direct link to Defined in")

[server/registration.ts:528](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L528)

---

### handler[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#handler "Direct link to handler")

• **handler**: (`ctx`: `Ctx`, `args`: [`ObjectType`](https://docs.convex.dev/api/modules/values.html#objecttype)<`ArgsValidator`>) => `Returns`

#### Type declaration[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#type-declaration "Direct link to Type declaration")

▸ (`ctx`, `args`): `Returns`

The implementation of this function.

This is a function that takes in the appropriate context and arguments
and produces some result.

##### Parameters[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `ctx` | `Ctx` | The context object. This is one of QueryCtx, MutationCtx, or ActionCtx depending on the function type. |
| `args` | [`ObjectType`](https://docs.convex.dev/api/modules/values.html#objecttype)<`ArgsValidator`> | The arguments object for this function. This will match the type defined by the argument validator. |

##### Returns[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#returns "Direct link to Returns")

`Returns`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#defined-in-1 "Direct link to Defined in")

[server/registration.ts:542](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L542)

[Previous

UserIdentity](https://docs.convex.dev/api/interfaces/server.UserIdentity.html)[Next

VectorFilterBuilder](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#properties)
  + [args](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#args)
  + [handler](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html#handler)
