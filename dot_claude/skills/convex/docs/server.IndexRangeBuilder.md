---
title: "Interface: IndexRangeBuilder<Document, IndexFields, FieldNum> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* IndexRangeBuilder

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).IndexRangeBuilder

Builder to define an index range to query.

An index range is a description of which documents Convex should consider
when running the query.

An index range is always a chained list of:

1. 0 or more equality expressions defined with `.eq`.
2. [Optionally] A lower bound expression defined with `.gt` or `.gte`.
3. [Optionally] An upper bound expression defined with `.lt` or `.lte`.

**You must step through fields in index order.**

Each equality expression must compare a different index field, starting from
the beginning and in order. The upper and lower bounds must follow the
equality expressions and compare the next field.

For example, if there is an index of messages on
`["projectId", "priority"]`, a range searching for "messages in 'myProjectId'
with priority at least 100" would look like:

```
q.eq("projectId", myProjectId)
 .gte("priority", 100)
```

**The performance of your query is based on the specificity of the range.**

This class is designed to only allow you to specify ranges that Convex can
efficiently use your index to find. For all other filtering use
[filter](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter).

To learn about indexes, see [Indexes](https://docs.convex.dev/using/indexes.html).

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Document` | extends [`GenericDocument`](https://docs.convex.dev/api/modules/server.html#genericdocument) |
| `IndexFields` | extends [`GenericIndexFields`](https://docs.convex.dev/api/modules/server.html#genericindexfields) |
| `FieldNum` | extends `number` = `0` |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#hierarchy "Direct link to Hierarchy")

* `LowerBoundIndexRangeBuilder`<`Document`, `IndexFields`[`FieldNum`]>

  ↳ **`IndexRangeBuilder`**

## Methods[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#methods "Direct link to Methods")

### eq[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#eq "Direct link to eq")

▸ **eq**(`fieldName`, `value`): `NextIndexRangeBuilder`<`Document`, `IndexFields`, `FieldNum`>

Restrict this range to documents where `doc[fieldName] === value`.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fieldName` | `IndexFields`[`FieldNum`] | The name of the field to compare. Must be the next field in the index. |
| `value` | [`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<`Document`, `IndexFields`[`FieldNum`]> | The value to compare against. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#returns "Direct link to Returns")

`NextIndexRangeBuilder`<`Document`, `IndexFields`, `FieldNum`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#defined-in "Direct link to Defined in")

[server/index\_range\_builder.ts:76](https://github.com/get-convex/convex-js/blob/main/src/server/index_range_builder.ts#L76)

---

### gt[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#gt "Direct link to gt")

▸ **gt**(`fieldName`, `value`): `UpperBoundIndexRangeBuilder`<`Document`, `IndexFields`[`FieldNum`]>

Restrict this range to documents where `doc[fieldName] > value`.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fieldName` | `IndexFields`[`FieldNum`] | The name of the field to compare. Must be the next field in the index. |
| `value` | [`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<`Document`, `IndexFields`[`FieldNum`]> | The value to compare against. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#returns-1 "Direct link to Returns")

`UpperBoundIndexRangeBuilder`<`Document`, `IndexFields`[`FieldNum`]>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#inherited-from "Direct link to Inherited from")

LowerBoundIndexRangeBuilder.gt

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#defined-in-1 "Direct link to Defined in")

[server/index\_range\_builder.ts:115](https://github.com/get-convex/convex-js/blob/main/src/server/index_range_builder.ts#L115)

---

### gte[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#gte "Direct link to gte")

▸ **gte**(`fieldName`, `value`): `UpperBoundIndexRangeBuilder`<`Document`, `IndexFields`[`FieldNum`]>

Restrict this range to documents where `doc[fieldName] >= value`.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fieldName` | `IndexFields`[`FieldNum`] | The name of the field to compare. Must be the next field in the index. |
| `value` | [`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<`Document`, `IndexFields`[`FieldNum`]> | The value to compare against. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#returns-2 "Direct link to Returns")

`UpperBoundIndexRangeBuilder`<`Document`, `IndexFields`[`FieldNum`]>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#inherited-from-1 "Direct link to Inherited from")

LowerBoundIndexRangeBuilder.gte

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#defined-in-2 "Direct link to Defined in")

[server/index\_range\_builder.ts:126](https://github.com/get-convex/convex-js/blob/main/src/server/index_range_builder.ts#L126)

---

### lt[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#lt "Direct link to lt")

▸ **lt**(`fieldName`, `value`): [`IndexRange`](https://docs.convex.dev/api/classes/server.IndexRange.html)

Restrict this range to documents where `doc[fieldName] < value`.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fieldName` | `IndexFields`[`FieldNum`] | The name of the field to compare. Must be the same index field used in the lower bound (`.gt` or `.gte`) or the next field if no lower bound was specified. |
| `value` | [`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<`Document`, `IndexFields`[`FieldNum`]> | The value to compare against. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#returns-3 "Direct link to Returns")

[`IndexRange`](https://docs.convex.dev/api/classes/server.IndexRange.html)

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#inherited-from-2 "Direct link to Inherited from")

LowerBoundIndexRangeBuilder.lt

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#defined-in-3 "Direct link to Defined in")

[server/index\_range\_builder.ts:151](https://github.com/get-convex/convex-js/blob/main/src/server/index_range_builder.ts#L151)

---

### lte[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#lte "Direct link to lte")

▸ **lte**(`fieldName`, `value`): [`IndexRange`](https://docs.convex.dev/api/classes/server.IndexRange.html)

Restrict this range to documents where `doc[fieldName] <= value`.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fieldName` | `IndexFields`[`FieldNum`] | The name of the field to compare. Must be the same index field used in the lower bound (`.gt` or `.gte`) or the next field if no lower bound was specified. |
| `value` | [`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<`Document`, `IndexFields`[`FieldNum`]> | The value to compare against. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#returns-4 "Direct link to Returns")

[`IndexRange`](https://docs.convex.dev/api/classes/server.IndexRange.html)

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#inherited-from-3 "Direct link to Inherited from")

LowerBoundIndexRangeBuilder.lte

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#defined-in-4 "Direct link to Defined in")

[server/index\_range\_builder.ts:164](https://github.com/get-convex/convex-js/blob/main/src/server/index_range_builder.ts#L164)

[Previous

GenericQueryCtx](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html)[Next

OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#methods)
  + [eq](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#eq)
  + [gt](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#gt)
  + [gte](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#gte)
  + [lt](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#lt)
  + [lte](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html#lte)
