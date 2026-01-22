---
title: "Interface: DefineSchemaOptions<StrictTableNameTypes> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* DefineSchemaOptions

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).DefineSchemaOptions

Options for [defineSchema](https://docs.convex.dev/api/modules/server.html#defineschema).

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `StrictTableNameTypes` | extends `boolean` |

## Properties[​](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#properties "Direct link to Properties")

### schemaValidation[​](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#schemavalidation "Direct link to schemaValidation")

• `Optional` **schemaValidation**: `boolean`

Whether Convex should validate at runtime that all documents match
your schema.

If `schemaValidation` is `true`, Convex will:

1. Check that all existing documents match your schema when your schema
   is pushed.
2. Check that all insertions and updates match your schema during mutations.

If `schemaValidation` is `false`, Convex will not validate that new or
existing documents match your schema. You'll still get schema-specific
TypeScript types, but there will be no validation at runtime that your
documents match those types.

By default, `schemaValidation` is `true`.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#defined-in "Direct link to Defined in")

[server/schema.ts:727](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L727)

---

### strictTableNameTypes[​](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#stricttablenametypes "Direct link to strictTableNameTypes")

• `Optional` **strictTableNameTypes**: `StrictTableNameTypes`

Whether the TypeScript types should allow accessing tables not in the schema.

If `strictTableNameTypes` is `true`, using tables not listed in the schema
will generate a TypeScript compilation error.

If `strictTableNameTypes` is `false`, you'll be able to access tables not
listed in the schema and their document type will be `any`.

`strictTableNameTypes: false` is useful for rapid prototyping.

Regardless of the value of `strictTableNameTypes`, your schema will only
validate documents in the tables listed in the schema. You can still create
and modify other tables on the dashboard or in JavaScript mutations.

By default, `strictTableNameTypes` is `true`.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#defined-in-1 "Direct link to Defined in")

[server/schema.ts:746](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L746)

[Previous

CronJob](https://docs.convex.dev/api/interfaces/server.CronJob.html)[Next

FilterBuilder](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#properties)
  + [schemaValidation](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#schemavalidation)
  + [strictTableNameTypes](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html#stricttablenametypes)
