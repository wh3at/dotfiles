---
title: "Interface: StorageReader | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.StorageReader"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* StorageReader

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).StorageReader

An interface to read files from storage within Convex query functions.

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#hierarchy "Direct link to Hierarchy")

* **`StorageReader`**

  ↳ [`StorageWriter`](https://docs.convex.dev/api/interfaces/server.StorageWriter.html)

## Methods[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#methods "Direct link to Methods")

### getUrl[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl "Direct link to getUrl")

▸ **getUrl**(`storageId`): `Promise`<`null` | `string`>

Get the URL for a file in storage by its `Id<"_storage">`.

The GET response includes a standard HTTP Digest header with a sha256 checksum.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file to fetch from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#returns "Direct link to Returns")

`Promise`<`null` | `string`>

* A url which fetches the file via an HTTP GET, or `null` if it no longer exists.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#defined-in "Direct link to Defined in")

[server/storage.ts:51](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L51)

▸ **getUrl**<`T`>(`storageId`): `Promise`<`null` | `string`>

**`Deprecated`**

Passing a string is deprecated, use `storage.getUrl(Id<"_storage">)` instead.

Get the URL for a file in storage by its [StorageId](https://docs.convex.dev/api/modules/server.html#storageid).

The GET response includes a standard HTTP Digest header with a sha256 checksum.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file to fetch from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#returns-1 "Direct link to Returns")

`Promise`<`null` | `string`>

* A url which fetches the file via an HTTP GET, or `null` if it no longer exists.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#defined-in-1 "Direct link to Defined in")

[server/storage.ts:63](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L63)

---

### getMetadata[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#getmetadata "Direct link to getMetadata")

▸ **getMetadata**(`storageId`): `Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

**`Deprecated`**

This function is deprecated, use `db.system.get(Id<"_storage">)` instead.

Get metadata for a file.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#returns-2 "Direct link to Returns")

`Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

* A [FileMetadata](https://docs.convex.dev/api/modules/server.html#filemetadata) object if found or `null` if not found.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#defined-in-2 "Direct link to Defined in")

[server/storage.ts:75](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L75)

▸ **getMetadata**<`T`>(`storageId`): `Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

**`Deprecated`**

This function is deprecated, use `db.system.get(Id<"_storage">)` instead.

Get metadata for a file.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#returns-3 "Direct link to Returns")

`Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

* A [FileMetadata](https://docs.convex.dev/api/modules/server.html#filemetadata) object if found or `null` if not found.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageReader.html#defined-in-3 "Direct link to Defined in")

[server/storage.ts:85](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L85)

[Previous

StorageActionWriter](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html)[Next

StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html)

* [Hierarchy](https://docs.convex.dev/api/interfaces/server.StorageReader.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.StorageReader.html#methods)
  + [getUrl](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl)
  + [getMetadata](https://docs.convex.dev/api/interfaces/server.StorageReader.html#getmetadata)
