---
title: "Interface: FilterBuilder<TableInfo> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.FilterBuilder"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* FilterBuilder

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).FilterBuilder

An interface for defining filters in queries.

`FilterBuilder` has various methods that produce [Expression](https://docs.convex.dev/api/classes/server.Expression.html)s.
These expressions can be nested together along with constants to express
a filter predicate.

`FilterBuilder` is used within [filter](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter) to create query
filters.

Here are the available methods:

|  |  |
| --- | --- |
| **Comparisons** | Error when `l` and `r` are not the same type. |
| [`eq(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#eq) | `l === r` |
| [`neq(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#neq) | `l !== r` |
| [`lt(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#lt) | `l < r` |
| [`lte(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#lte) | `l <= r` |
| [`gt(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#gt) | `l > r` |
| [`gte(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#gte) | `l >= r` |
|  |  |
| **Arithmetic** | Error when `l` and `r` are not the same type. |
| [`add(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#add) | `l + r` |
| [`sub(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#sub) | `l - r` |
| [`mul(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#mul) | `l * r` |
| [`div(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#div) | `l / r` |
| [`mod(l, r)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#mod) | `l % r` |
| [`neg(x)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#neg) | `-x` |
|  |  |
| **Logic** | Error if any param is not a `bool`. |
| [`not(x)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#not) | `!x` |
| [`and(a, b, ..., z)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#and) | `a && b && ... && z` |
| [`or(a, b, ..., z)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#or) | `a || b || ... || z` |
|  |  |
| **Other** |  |
| [`field(fieldPath)`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#field) | Evaluates to the field at `fieldPath`. |

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableInfo` | extends [`GenericTableInfo`](https://docs.convex.dev/api/modules/server.html#generictableinfo) |

## Methods[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#methods "Direct link to Methods")

### eq[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#eq "Direct link to eq")

▸ **eq**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`l === r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `undefined` | [`Value`](https://docs.convex.dev/api/modules/values.html#value) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in "Direct link to Defined in")

[server/filter\_builder.ts:87](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L87)

---

### neq[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#neq "Direct link to neq")

▸ **neq**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`l !== r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `undefined` | [`Value`](https://docs.convex.dev/api/modules/values.html#value) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-1 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-1 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-1 "Direct link to Defined in")

[server/filter\_builder.ts:97](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L97)

---

### lt[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#lt "Direct link to lt")

▸ **lt**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`l < r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`Value`](https://docs.convex.dev/api/modules/values.html#value) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-2 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-2 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-2 "Direct link to Defined in")

[server/filter\_builder.ts:107](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L107)

---

### lte[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#lte "Direct link to lte")

▸ **lte**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`l <= r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`Value`](https://docs.convex.dev/api/modules/values.html#value) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-3 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-3 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-3 "Direct link to Defined in")

[server/filter\_builder.ts:117](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L117)

---

### gt[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#gt "Direct link to gt")

▸ **gt**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`l > r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-5 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`Value`](https://docs.convex.dev/api/modules/values.html#value) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-4 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-4 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-4 "Direct link to Defined in")

[server/filter\_builder.ts:127](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L127)

---

### gte[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#gte "Direct link to gte")

▸ **gte**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`l >= r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-6 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`Value`](https://docs.convex.dev/api/modules/values.html#value) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-5 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-5 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-5 "Direct link to Defined in")

[server/filter\_builder.ts:137](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L137)

---

### add[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#add "Direct link to add")

▸ **add**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

`l + r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-7 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`NumericValue`](https://docs.convex.dev/api/modules/values.html#numericvalue) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-6 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-6 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-6 "Direct link to Defined in")

[server/filter\_builder.ts:149](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L149)

---

### sub[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#sub "Direct link to sub")

▸ **sub**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

`l - r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-8 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`NumericValue`](https://docs.convex.dev/api/modules/values.html#numericvalue) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-7 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-7 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-7 "Direct link to Defined in")

[server/filter\_builder.ts:159](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L159)

---

### mul[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#mul "Direct link to mul")

▸ **mul**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

`l * r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-9 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`NumericValue`](https://docs.convex.dev/api/modules/values.html#numericvalue) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-8 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-8 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-8 "Direct link to Defined in")

[server/filter\_builder.ts:169](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L169)

---

### div[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#div "Direct link to div")

▸ **div**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

`l / r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-10 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`NumericValue`](https://docs.convex.dev/api/modules/values.html#numericvalue) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-9 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-9 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-9 "Direct link to Defined in")

[server/filter\_builder.ts:179](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L179)

---

### mod[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#mod "Direct link to mod")

▸ **mod**<`T`>(`l`, `r`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

`l % r`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-11 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`NumericValue`](https://docs.convex.dev/api/modules/values.html#numericvalue) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-10 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `l` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |
| `r` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-10 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-10 "Direct link to Defined in")

[server/filter\_builder.ts:189](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L189)

---

### neg[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#neg "Direct link to neg")

▸ **neg**<`T`>(`x`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

`-x`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-12 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`NumericValue`](https://docs.convex.dev/api/modules/values.html#numericvalue) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-11 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `x` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`T`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-11 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`T`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-11 "Direct link to Defined in")

[server/filter\_builder.ts:199](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L199)

---

### and[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#and "Direct link to and")

▸ **and**(`...exprs`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`exprs[0] && exprs[1] && ... && exprs[n]`

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-12 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `...exprs` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`boolean`>[] |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-12 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-12 "Direct link to Defined in")

[server/filter\_builder.ts:208](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L208)

---

### or[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#or "Direct link to or")

▸ **or**(`...exprs`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`exprs[0] || exprs[1] || ... || exprs[n]`

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-13 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `...exprs` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`boolean`>[] |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-13 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-13 "Direct link to Defined in")

[server/filter\_builder.ts:215](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L215)

---

### not[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#not "Direct link to not")

▸ **not**(`x`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

`!x`

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-14 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `x` | [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`boolean`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-14 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-14 "Direct link to Defined in")

[server/filter\_builder.ts:222](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L222)

---

### field[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#field "Direct link to field")

▸ **field**<`FieldPath`>(`fieldPath`): [`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<[`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, `FieldPath`>>

Evaluates to the field at the given `fieldPath`.

For example, in [filter](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter) this can be used to examine the values being filtered.

#### Example[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#example "Direct link to Example")

On this object:

```
{
  "user": {
    "isActive": true
  }
}
```

`field("user.isActive")` evaluates to `true`.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters-13 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FieldPath` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#parameters-15 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `fieldPath` | `FieldPath` |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#returns-15 "Direct link to Returns")

[`Expression`](https://docs.convex.dev/api/classes/server.Expression.html)<[`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, `FieldPath`>>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#defined-in-15 "Direct link to Defined in")

[server/filter\_builder.ts:246](https://github.com/get-convex/convex-js/blob/main/src/server/filter_builder.ts#L246)

[Previous

DefineSchemaOptions](https://docs.convex.dev/api/interfaces/server.DefineSchemaOptions.html)[Next

GenericActionCtx](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#type-parameters)
* [Methods](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#methods)
  + [eq](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#eq)
  + [neq](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#neq)
  + [lt](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#lt)
  + [lte](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#lte)
  + [gt](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#gt)
  + [gte](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#gte)
  + [add](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#add)
  + [sub](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#sub)
  + [mul](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#mul)
  + [div](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#div)
  + [mod](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#mod)
  + [neg](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#neg)
  + [and](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#and)
  + [or](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#or)
  + [not](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#not)
  + [field](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html#field)
