---
title: "Module: values | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/modules/values"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* convex/values

Copy as Markdown

Copied!

On this page

Utilities for working with values stored in Convex.

You can see the full set of supported types at
[Types](https://docs.convex.dev/using/types.html).

## Namespaces[​](https://docs.convex.dev/api/modules/values.html#namespaces "Direct link to Namespaces")

* [Base64](https://docs.convex.dev/api/namespaces/values.Base64.html)

## Classes[​](https://docs.convex.dev/api/modules/values.html#classes "Direct link to Classes")

* [ConvexError](https://docs.convex.dev/api/classes/values.ConvexError.html)
* [VId](https://docs.convex.dev/api/classes/values.VId.html)
* [VFloat64](https://docs.convex.dev/api/classes/values.VFloat64.html)
* [VInt64](https://docs.convex.dev/api/classes/values.VInt64.html)
* [VBoolean](https://docs.convex.dev/api/classes/values.VBoolean.html)
* [VBytes](https://docs.convex.dev/api/classes/values.VBytes.html)
* [VString](https://docs.convex.dev/api/classes/values.VString.html)
* [VNull](https://docs.convex.dev/api/classes/values.VNull.html)
* [VAny](https://docs.convex.dev/api/classes/values.VAny.html)
* [VObject](https://docs.convex.dev/api/classes/values.VObject.html)
* [VLiteral](https://docs.convex.dev/api/classes/values.VLiteral.html)
* [VArray](https://docs.convex.dev/api/classes/values.VArray.html)
* [VRecord](https://docs.convex.dev/api/classes/values.VRecord.html)
* [VUnion](https://docs.convex.dev/api/classes/values.VUnion.html)

## Type Aliases[​](https://docs.convex.dev/api/modules/values.html#type-aliases "Direct link to Type Aliases")

### GenericValidator[​](https://docs.convex.dev/api/modules/values.html#genericvalidator "Direct link to GenericValidator")

Ƭ **GenericValidator**: [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`>

The type that all validators must extend.

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in "Direct link to Defined in")

[values/validator.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validator.ts#L27)

---

### AsObjectValidator[​](https://docs.convex.dev/api/modules/values.html#asobjectvalidator "Direct link to AsObjectValidator")

Ƭ **AsObjectValidator**<`V`>: `V` extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`> ? `V` : `V` extends [`PropertyValidators`](https://docs.convex.dev/api/modules/values.html#propertyvalidators) ? [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<[`ObjectType`](https://docs.convex.dev/api/modules/values.html#objecttype)<`V`>> : `never`

Coerce an object with validators as properties to a validator.
If a validator is passed, return it.

#### Type parameters[​](https://docs.convex.dev/api/modules/values.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `V` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`> | [`PropertyValidators`](https://docs.convex.dev/api/modules/values.html#propertyvalidators) |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-1 "Direct link to Defined in")

[values/validator.ts:61](https://github.com/get-convex/convex-js/blob/main/src/values/validator.ts#L61)

---

### PropertyValidators[​](https://docs.convex.dev/api/modules/values.html#propertyvalidators "Direct link to PropertyValidators")

Ƭ **PropertyValidators**: `Record`<`string`, [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty), `any`>>

Validators for each property of an object.

This is represented as an object mapping the property name to its
[Validator](https://docs.convex.dev/api/modules/values.html#validator).

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-2 "Direct link to Defined in")

[values/validator.ts:242](https://github.com/get-convex/convex-js/blob/main/src/values/validator.ts#L242)

---

### ObjectType[​](https://docs.convex.dev/api/modules/values.html#objecttype "Direct link to ObjectType")

Ƭ **ObjectType**<`Fields`>: [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<{ [Property in OptionalKeys<Fields>]?: Exclude<Infer<Fields[Property]>, undefined> } & { [Property in RequiredKeys<Fields>]: Infer<Fields[Property]> }>

Compute the type of an object from [PropertyValidators](https://docs.convex.dev/api/modules/values.html#propertyvalidators).

#### Type parameters[​](https://docs.convex.dev/api/modules/values.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Fields` | extends [`PropertyValidators`](https://docs.convex.dev/api/modules/values.html#propertyvalidators) |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-3 "Direct link to Defined in")

[values/validator.ts:252](https://github.com/get-convex/convex-js/blob/main/src/values/validator.ts#L252)

---

### Infer[​](https://docs.convex.dev/api/modules/values.html#infer "Direct link to Infer")

Ƭ **Infer**<`T`>: `T`[`"type"`]

Extract a TypeScript type from a validator.

Example usage:

```
const objectSchema = v.object({
  property: v.string(),
});
type MyObject = Infer<typeof objectSchema>; // { property: string }
```

**`Type Param`**

The type of a [Validator](https://docs.convex.dev/api/modules/values.html#validator) constructed with [v](https://docs.convex.dev/api/modules/values.html#v).

#### Type parameters[​](https://docs.convex.dev/api/modules/values.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty), `any`> |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-4 "Direct link to Defined in")

[values/validator.ts:294](https://github.com/get-convex/convex-js/blob/main/src/values/validator.ts#L294)

---

### VOptional[​](https://docs.convex.dev/api/modules/values.html#voptional "Direct link to VOptional")

Ƭ **VOptional**<`T`>: `T` extends [`VId`](https://docs.convex.dev/api/classes/values.VId.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VId`](https://docs.convex.dev/api/classes/values.VId.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VInt64`](https://docs.convex.dev/api/classes/values.VInt64.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VInt64`](https://docs.convex.dev/api/classes/values.VInt64.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VBoolean`](https://docs.convex.dev/api/classes/values.VBoolean.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VBoolean`](https://docs.convex.dev/api/classes/values.VBoolean.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VNull`](https://docs.convex.dev/api/classes/values.VNull.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VNull`](https://docs.convex.dev/api/classes/values.VNull.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VAny`](https://docs.convex.dev/api/classes/values.VAny.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VAny`](https://docs.convex.dev/api/classes/values.VAny.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VBytes`](https://docs.convex.dev/api/classes/values.VBytes.html)<infer Type, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VBytes`](https://docs.convex.dev/api/classes/values.VBytes.html)<`Type` | `undefined`, `"optional"`> : `T` extends [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<infer Type, infer Fields, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty), infer FieldPaths> ? [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<`Type` | `undefined`, `Fields`, `"optional"`, `FieldPaths`> : `T` extends [`VArray`](https://docs.convex.dev/api/classes/values.VArray.html)<infer Type, infer Element, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty)> ? [`VArray`](https://docs.convex.dev/api/classes/values.VArray.html)<`Type` | `undefined`, `Element`, `"optional"`> : `T` extends [`VRecord`](https://docs.convex.dev/api/classes/values.VRecord.html)<infer Type, infer Key, infer Value, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty), infer FieldPaths> ? [`VRecord`](https://docs.convex.dev/api/classes/values.VRecord.html)<`Type` | `undefined`, `Key`, `Value`, `"optional"`, `FieldPaths`> : `T` extends [`VUnion`](https://docs.convex.dev/api/classes/values.VUnion.html)<infer Type, infer Members, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty), infer FieldPaths> ? [`VUnion`](https://docs.convex.dev/api/classes/values.VUnion.html)<`Type` | `undefined`, `Members`, `"optional"`, `FieldPaths`> : `never`

#### Type parameters[​](https://docs.convex.dev/api/modules/values.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty), `any`> |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:618](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L618)

---

### OptionalProperty[​](https://docs.convex.dev/api/modules/values.html#optionalproperty "Direct link to OptionalProperty")

Ƭ **OptionalProperty**: `"optional"` | `"required"`

Type representing whether a property in an object is optional or required.

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-6 "Direct link to Defined in")

[values/validators.ts:651](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L651)

---

### Validator[​](https://docs.convex.dev/api/modules/values.html#validator "Direct link to Validator")

Ƭ **Validator**<`Type`, `IsOptional`, `FieldPaths`>: [`VId`](https://docs.convex.dev/api/classes/values.VId.html)<`Type`, `IsOptional`> | [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<`Type`, `IsOptional`> | [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<`Type`, `IsOptional`> | [`VInt64`](https://docs.convex.dev/api/classes/values.VInt64.html)<`Type`, `IsOptional`> | [`VBoolean`](https://docs.convex.dev/api/classes/values.VBoolean.html)<`Type`, `IsOptional`> | [`VNull`](https://docs.convex.dev/api/classes/values.VNull.html)<`Type`, `IsOptional`> | [`VAny`](https://docs.convex.dev/api/classes/values.VAny.html)<`Type`, `IsOptional`> | [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`Type`, `IsOptional`> | [`VBytes`](https://docs.convex.dev/api/classes/values.VBytes.html)<`Type`, `IsOptional`> | [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<`Type`, `Record`<`string`, [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty), `any`>>, `IsOptional`, `FieldPaths`> | [`VArray`](https://docs.convex.dev/api/classes/values.VArray.html)<`Type`, [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`>, `IsOptional`> | [`VRecord`](https://docs.convex.dev/api/classes/values.VRecord.html)<`Type`, [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`string`, `"required"`, `any`>, [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`>, `IsOptional`, `FieldPaths`> | [`VUnion`](https://docs.convex.dev/api/classes/values.VUnion.html)<`Type`, [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`>[], `IsOptional`, `FieldPaths`>

A validator for a Convex value.

This should be constructed using the validator builder, [v](https://docs.convex.dev/api/modules/values.html#v).

A validator encapsulates:

* The TypeScript type of this value.
* Whether this field should be optional if it's included in an object.
* The TypeScript type for the set of index field paths that can be used to
  build indexes on this value.
* A JSON representation of the validator.

Specific types of validators contain additional information: for example
an `ArrayValidator` contains an `element` property with the validator
used to validate each element of the list. Use the shared 'kind' property
to identity the type of validator.

More validators can be added in future releases so an exhaustive
switch statement on validator `kind` should be expected to break
in future releases of Convex.

#### Type parameters[​](https://docs.convex.dev/api/modules/values.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |
| `FieldPaths` | extends `string` = `never` |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-7 "Direct link to Defined in")

[values/validators.ts:676](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L676)

---

### ObjectFieldType[​](https://docs.convex.dev/api/modules/values.html#objectfieldtype "Direct link to ObjectFieldType")

Ƭ **ObjectFieldType**: `Object`

#### Type declaration[​](https://docs.convex.dev/api/modules/values.html#type-declaration "Direct link to Type declaration")

| Name | Type |
| --- | --- |
| `fieldType` | [`ValidatorJSON`](https://docs.convex.dev/api/modules/values.html#validatorjson) |
| `optional` | `boolean` |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-8 "Direct link to Defined in")

[values/validators.ts:717](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L717)

---

### ValidatorJSON[​](https://docs.convex.dev/api/modules/values.html#validatorjson "Direct link to ValidatorJSON")

Ƭ **ValidatorJSON**: { `type`: `"null"` } | { `type`: `"number"` } | { `type`: `"bigint"` } | { `type`: `"boolean"` } | { `type`: `"string"` } | { `type`: `"bytes"` } | { `type`: `"any"` } | { `type`: `"literal"` ; `value`: [`JSONValue`](https://docs.convex.dev/api/modules/values.html#jsonvalue) } | { `type`: `"id"` ; `tableName`: `string` } | { `type`: `"array"` ; `value`: [`ValidatorJSON`](https://docs.convex.dev/api/modules/values.html#validatorjson) } | { `type`: `"record"` ; `keys`: [`RecordKeyValidatorJSON`](https://docs.convex.dev/api/modules/values.html#recordkeyvalidatorjson) ; `values`: [`RecordValueValidatorJSON`](https://docs.convex.dev/api/modules/values.html#recordvaluevalidatorjson) } | { `type`: `"object"` ; `value`: `Record`<`string`, [`ObjectFieldType`](https://docs.convex.dev/api/modules/values.html#objectfieldtype)> } | { `type`: `"union"` ; `value`: [`ValidatorJSON`](https://docs.convex.dev/api/modules/values.html#validatorjson)[] }

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-9 "Direct link to Defined in")

[values/validators.ts:719](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L719)

---

### RecordKeyValidatorJSON[​](https://docs.convex.dev/api/modules/values.html#recordkeyvalidatorjson "Direct link to RecordKeyValidatorJSON")

Ƭ **RecordKeyValidatorJSON**: { `type`: `"string"` } | { `type`: `"id"` ; `tableName`: `string` } | { `type`: `"union"` ; `value`: [`RecordKeyValidatorJSON`](https://docs.convex.dev/api/modules/values.html#recordkeyvalidatorjson)[] }

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-10 "Direct link to Defined in")

[values/validators.ts:738](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L738)

---

### RecordValueValidatorJSON[​](https://docs.convex.dev/api/modules/values.html#recordvaluevalidatorjson "Direct link to RecordValueValidatorJSON")

Ƭ **RecordValueValidatorJSON**: [`ObjectFieldType`](https://docs.convex.dev/api/modules/values.html#objectfieldtype) & { `optional`: `false` }

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-11 "Direct link to Defined in")

[values/validators.ts:743](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L743)

---

### JSONValue[​](https://docs.convex.dev/api/modules/values.html#jsonvalue "Direct link to JSONValue")

Ƭ **JSONValue**: `null` | `boolean` | `number` | `string` | [`JSONValue`](https://docs.convex.dev/api/modules/values.html#jsonvalue)[] | { `[key: string]`: [`JSONValue`](https://docs.convex.dev/api/modules/values.html#jsonvalue); }

The type of JavaScript values serializable to JSON.

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-12 "Direct link to Defined in")

[values/value.ts:24](https://github.com/get-convex/convex-js/blob/main/src/values/value.ts#L24)

---

### GenericId[​](https://docs.convex.dev/api/modules/values.html#genericid "Direct link to GenericId")

Ƭ **GenericId**<`TableName`>: `string` & { `__tableName`: `TableName` }

An identifier for a document in Convex.

Convex documents are uniquely identified by their `Id`, which is accessible
on the `_id` field. To learn more, see [Document IDs](https://docs.convex.dev/database/document-ids.html).

Documents can be loaded using `db.get(id)` in query and mutation functions.

IDs are base 32 encoded strings which are URL safe.

IDs are just strings at runtime, but this type can be used to distinguish them from other
strings at compile time.

If you're using code generation, use the `Id` type generated for your data model in
`convex/_generated/dataModel.d.ts`.

#### Type parameters[​](https://docs.convex.dev/api/modules/values.html#type-parameters-5 "Direct link to Type parameters")

| Name | Type | Description |
| --- | --- | --- |
| `TableName` | extends `string` | A string literal type of the table name (like "users"). |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-13 "Direct link to Defined in")

[values/value.ts:52](https://github.com/get-convex/convex-js/blob/main/src/values/value.ts#L52)

---

### Value[​](https://docs.convex.dev/api/modules/values.html#value "Direct link to Value")

Ƭ **Value**: `null` | `bigint` | `number` | `boolean` | `string` | `ArrayBuffer` | [`Value`](https://docs.convex.dev/api/modules/values.html#value)[] | { `[key: string]`: `undefined` | [`Value`](https://docs.convex.dev/api/modules/values.html#value); }

A value supported by Convex.

Values can be:

* stored inside of documents.
* used as arguments and return types to queries and mutation functions.

You can see the full set of supported types at
[Types](https://docs.convex.dev/using/types.html).

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-14 "Direct link to Defined in")

[values/value.ts:66](https://github.com/get-convex/convex-js/blob/main/src/values/value.ts#L66)

---

### NumericValue[​](https://docs.convex.dev/api/modules/values.html#numericvalue "Direct link to NumericValue")

Ƭ **NumericValue**: `bigint` | `number`

The types of [Value](https://docs.convex.dev/api/modules/values.html#value) that can be used to represent numbers.

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-15 "Direct link to Defined in")

[values/value.ts:81](https://github.com/get-convex/convex-js/blob/main/src/values/value.ts#L81)

## Variables[​](https://docs.convex.dev/api/modules/values.html#variables "Direct link to Variables")

### v[​](https://docs.convex.dev/api/modules/values.html#v "Direct link to v")

• `Const` **v**: `Object`

The validator builder.

This builder allows you to build validators for Convex values.

Validators can be used in [schema definitions](https://docs.convex.dev/database/schemas.html)
and as input validators for Convex functions.

#### Type declaration[​](https://docs.convex.dev/api/modules/values.html#type-declaration-1 "Direct link to Type declaration")

| Name | Type |
| --- | --- |
| `id` | <TableName>(`tableName`: `TableName`) => [`VId`](https://docs.convex.dev/api/classes/values.VId.html)<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>, `"required"`> |
| `null` | () => [`VNull`](https://docs.convex.dev/api/classes/values.VNull.html)<`null`, `"required"`> |
| `number` | () => [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<`number`, `"required"`> |
| `float64` | () => [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<`number`, `"required"`> |
| `bigint` | () => [`VInt64`](https://docs.convex.dev/api/classes/values.VInt64.html)<`bigint`, `"required"`> |
| `int64` | () => [`VInt64`](https://docs.convex.dev/api/classes/values.VInt64.html)<`bigint`, `"required"`> |
| `boolean` | () => [`VBoolean`](https://docs.convex.dev/api/classes/values.VBoolean.html)<`boolean`, `"required"`> |
| `string` | () => [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<`string`, `"required"`> |
| `bytes` | () => [`VBytes`](https://docs.convex.dev/api/classes/values.VBytes.html)<`ArrayBuffer`, `"required"`> |
| `literal` | <T>(`literal`: `T`) => [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`T`, `"required"`> |
| `array` | <T>(`element`: `T`) => [`VArray`](https://docs.convex.dev/api/classes/values.VArray.html)<`T`[`"type"`][], `T`, `"required"`> |
| `object` | <T>(`fields`: `T`) => [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<[`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<{ [Property in string | number | symbol]?: Exclude<Infer<T[Property]>, undefined> } & { [Property in string | number | symbol]: Infer<T[Property]> }>, `T`, `"required"`, { [Property in string | number | symbol]: Property | `${Property & string}.${T[Property]["fieldPaths"]}` }[keyof `T`] & `string`> |
| `record` | <Key, Value>(`keys`: `Key`, `values`: `Value`) => [`VRecord`](https://docs.convex.dev/api/classes/values.VRecord.html)<`Record`<[`Infer`](https://docs.convex.dev/api/modules/values.html#infer)<`Key`>, `Value`[`"type"`]>, `Key`, `Value`, `"required"`, `string`> |
| `union` | <T>(...`members`: `T`) => [`VUnion`](https://docs.convex.dev/api/classes/values.VUnion.html)<`T`[`number`][`"type"`], `T`, `"required"`, `T`[`number`][`"fieldPaths"`]> |
| `any` | () => [`VAny`](https://docs.convex.dev/api/classes/values.VAny.html)<`any`, `"required"`, `string`> |
| `optional` | <T>(`value`: `T`) => [`VOptional`](https://docs.convex.dev/api/modules/values.html#voptional)<`T`> |
| `nullable` | <T>(`value`: `T`) => [`VUnion`](https://docs.convex.dev/api/classes/values.VUnion.html)<`T` | [`VNull`](https://docs.convex.dev/api/classes/values.VNull.html)<`null`, `"required"`>[`"type"`], [`T`, [`VNull`](https://docs.convex.dev/api/classes/values.VNull.html)<`null`, `"required"`>], `"required"`, `T` | [`VNull`](https://docs.convex.dev/api/classes/values.VNull.html)<`null`, `"required"`>[`"fieldPaths"`]> |

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-16 "Direct link to Defined in")

[values/validator.ts:80](https://github.com/get-convex/convex-js/blob/main/src/values/validator.ts#L80)

## Functions[​](https://docs.convex.dev/api/modules/values.html#functions "Direct link to Functions")

### compareValues[​](https://docs.convex.dev/api/modules/values.html#comparevalues "Direct link to compareValues")

▸ **compareValues**(`k1`, `k2`): `number`

#### Parameters[​](https://docs.convex.dev/api/modules/values.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `k1` | `undefined` | [`Value`](https://docs.convex.dev/api/modules/values.html#value) |
| `k2` | `undefined` | [`Value`](https://docs.convex.dev/api/modules/values.html#value) |

#### Returns[​](https://docs.convex.dev/api/modules/values.html#returns "Direct link to Returns")

`number`

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-17 "Direct link to Defined in")

[values/compare.ts:4](https://github.com/get-convex/convex-js/blob/main/src/values/compare.ts#L4)

---

### asObjectValidator[​](https://docs.convex.dev/api/modules/values.html#asobjectvalidator-1 "Direct link to asObjectValidator")

▸ **asObjectValidator**<`V`>(`obj`): `V` extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`> ? `V` : `V` extends [`PropertyValidators`](https://docs.convex.dev/api/modules/values.html#propertyvalidators) ? [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<[`ObjectType`](https://docs.convex.dev/api/modules/values.html#objecttype)<`V`>> : `never`

Coerce an object with validators as properties to a validator.
If a validator is passed, return it.

#### Type parameters[​](https://docs.convex.dev/api/modules/values.html#type-parameters-6 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `V` | extends [`PropertyValidators`](https://docs.convex.dev/api/modules/values.html#propertyvalidators) | [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`> |

#### Parameters[​](https://docs.convex.dev/api/modules/values.html#parameters-1 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `obj` | `V` |

#### Returns[​](https://docs.convex.dev/api/modules/values.html#returns-1 "Direct link to Returns")

`V` extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`> ? `V` : `V` extends [`PropertyValidators`](https://docs.convex.dev/api/modules/values.html#propertyvalidators) ? [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<[`ObjectType`](https://docs.convex.dev/api/modules/values.html#objecttype)<`V`>> : `never`

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-18 "Direct link to Defined in")

[values/validator.ts:39](https://github.com/get-convex/convex-js/blob/main/src/values/validator.ts#L39)

---

### jsonToConvex[​](https://docs.convex.dev/api/modules/values.html#jsontoconvex "Direct link to jsonToConvex")

▸ **jsonToConvex**(`value`): [`Value`](https://docs.convex.dev/api/modules/values.html#value)

Parse a Convex value from its JSON representation.

This function will deserialize serialized Int64s to `BigInt`s, Bytes to `ArrayBuffer`s etc.

To learn more about Convex values, see [Types](https://docs.convex.dev/using/types.html).

#### Parameters[​](https://docs.convex.dev/api/modules/values.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `value` | [`JSONValue`](https://docs.convex.dev/api/modules/values.html#jsonvalue) | The JSON representation of a Convex value previously created with [convexToJson](https://docs.convex.dev/api/modules/values.html#convextojson). |

#### Returns[​](https://docs.convex.dev/api/modules/values.html#returns-2 "Direct link to Returns")

[`Value`](https://docs.convex.dev/api/modules/values.html#value)

The JavaScript representation of the Convex value.

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-19 "Direct link to Defined in")

[values/value.ts:187](https://github.com/get-convex/convex-js/blob/main/src/values/value.ts#L187)

---

### convexToJson[​](https://docs.convex.dev/api/modules/values.html#convextojson "Direct link to convexToJson")

▸ **convexToJson**(`value`): [`JSONValue`](https://docs.convex.dev/api/modules/values.html#jsonvalue)

Convert a Convex value to its JSON representation.

Use [jsonToConvex](https://docs.convex.dev/api/modules/values.html#jsontoconvex) to recreate the original value.

To learn more about Convex values, see [Types](https://docs.convex.dev/using/types.html).

#### Parameters[​](https://docs.convex.dev/api/modules/values.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `value` | [`Value`](https://docs.convex.dev/api/modules/values.html#value) | A Convex value to convert into JSON. |

#### Returns[​](https://docs.convex.dev/api/modules/values.html#returns-3 "Direct link to Returns")

[`JSONValue`](https://docs.convex.dev/api/modules/values.html#jsonvalue)

The JSON representation of `value`.

#### Defined in[​](https://docs.convex.dev/api/modules/values.html#defined-in-20 "Direct link to Defined in")

[values/value.ts:429](https://github.com/get-convex/convex-js/blob/main/src/values/value.ts#L429)

[Previous

convex/nextjs](https://docs.convex.dev/api/modules/nextjs)[Next

ConvexError](https://docs.convex.dev/api/classes/values.ConvexError.html)

* [Namespaces](https://docs.convex.dev/api/modules/values.html#namespaces)
* [Classes](https://docs.convex.dev/api/modules/values.html#classes)
* [Type Aliases](https://docs.convex.dev/api/modules/values.html#type-aliases)
  + [GenericValidator](https://docs.convex.dev/api/modules/values.html#genericvalidator)
  + [AsObjectValidator](https://docs.convex.dev/api/modules/values.html#asobjectvalidator)
  + [PropertyValidators](https://docs.convex.dev/api/modules/values.html#propertyvalidators)
  + [ObjectType](https://docs.convex.dev/api/modules/values.html#objecttype)
  + [Infer](https://docs.convex.dev/api/modules/values.html#infer)
  + [VOptional](https://docs.convex.dev/api/modules/values.html#voptional)
  + [OptionalProperty](https://docs.convex.dev/api/modules/values.html#optionalproperty)
  + [Validator](https://docs.convex.dev/api/modules/values.html#validator)
  + [ObjectFieldType](https://docs.convex.dev/api/modules/values.html#objectfieldtype)
  + [ValidatorJSON](https://docs.convex.dev/api/modules/values.html#validatorjson)
  + [RecordKeyValidatorJSON](https://docs.convex.dev/api/modules/values.html#recordkeyvalidatorjson)
  + [RecordValueValidatorJSON](https://docs.convex.dev/api/modules/values.html#recordvaluevalidatorjson)
  + [JSONValue](https://docs.convex.dev/api/modules/values.html#jsonvalue)
  + [GenericId](https://docs.convex.dev/api/modules/values.html#genericid)
  + [Value](https://docs.convex.dev/api/modules/values.html#value)
  + [NumericValue](https://docs.convex.dev/api/modules/values.html#numericvalue)
* [Variables](https://docs.convex.dev/api/modules/values.html#variables)
  + [v](https://docs.convex.dev/api/modules/values.html#v)
* [Functions](https://docs.convex.dev/api/modules/values.html#functions)
  + [compareValues](https://docs.convex.dev/api/modules/values.html#comparevalues)
  + [asObjectValidator](https://docs.convex.dev/api/modules/values.html#asobjectvalidator-1)
  + [jsonToConvex](https://docs.convex.dev/api/modules/values.html#jsontoconvex)
  + [convexToJson](https://docs.convex.dev/api/modules/values.html#convextojson)
