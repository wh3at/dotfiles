---
title: "Interface: StorageWriter | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.StorageWriter"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* StorageWriter

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).StorageWriter

An interface to write files to storage within Convex mutation functions.

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#hierarchy "Direct link to Hierarchy")

* [`StorageReader`](https://docs.convex.dev/api/interfaces/server.StorageReader.html)

  ↳ **`StorageWriter`**

  ↳↳ [`StorageActionWriter`](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html)

## Methods[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#methods "Direct link to Methods")

### getUrl[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#geturl "Direct link to getUrl")

▸ **getUrl**(`storageId`): `Promise`<`null` | `string`>

Get the URL for a file in storage by its `Id<"_storage">`.

The GET response includes a standard HTTP Digest header with a sha256 checksum.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file to fetch from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#returns "Direct link to Returns")

`Promise`<`null` | `string`>

* A url which fetches the file via an HTTP GET, or `null` if it no longer exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#inherited-from "Direct link to Inherited from")

[StorageReader](https://docs.convex.dev/api/interfaces/server.StorageReader.html).[getUrl](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#defined-in "Direct link to Defined in")

[server/storage.ts:51](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L51)

▸ **getUrl**<`T`>(`storageId`): `Promise`<`null` | `string`>

**`Deprecated`**

Passing a string is deprecated, use `storage.getUrl(Id<"_storage">)` instead.

Get the URL for a file in storage by its [StorageId](https://docs.convex.dev/api/modules/server.html#storageid).

The GET response includes a standard HTTP Digest header with a sha256 checksum.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file to fetch from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#returns-1 "Direct link to Returns")

`Promise`<`null` | `string`>

* A url which fetches the file via an HTTP GET, or `null` if it no longer exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#inherited-from-1 "Direct link to Inherited from")

[StorageReader](https://docs.convex.dev/api/interfaces/server.StorageReader.html).[getUrl](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#defined-in-1 "Direct link to Defined in")

[server/storage.ts:63](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L63)

---

### getMetadata[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#getmetadata "Direct link to getMetadata")

▸ **getMetadata**(`storageId`): `Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

**`Deprecated`**

This function is deprecated, use `db.system.get(Id<"_storage">)` instead.

Get metadata for a file.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#returns-2 "Direct link to Returns")

`Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

* A [FileMetadata](https://docs.convex.dev/api/modules/server.html#filemetadata) object if found or `null` if not found.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#inherited-from-2 "Direct link to Inherited from")

[StorageReader](https://docs.convex.dev/api/interfaces/server.StorageReader.html).[getMetadata](https://docs.convex.dev/api/interfaces/server.StorageReader.html#getmetadata)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#defined-in-2 "Direct link to Defined in")

[server/storage.ts:75](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L75)

▸ **getMetadata**<`T`>(`storageId`): `Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

**`Deprecated`**

This function is deprecated, use `db.system.get(Id<"_storage">)` instead.

Get metadata for a file.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#returns-3 "Direct link to Returns")

`Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

* A [FileMetadata](https://docs.convex.dev/api/modules/server.html#filemetadata) object if found or `null` if not found.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#inherited-from-3 "Direct link to Inherited from")

[StorageReader](https://docs.convex.dev/api/interfaces/server.StorageReader.html).[getMetadata](https://docs.convex.dev/api/interfaces/server.StorageReader.html#getmetadata)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#defined-in-3 "Direct link to Defined in")

[server/storage.ts:85](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L85)

---

### generateUploadUrl[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#generateuploadurl "Direct link to generateUploadUrl")

▸ **generateUploadUrl**(): `Promise`<`string`>

Fetch a short-lived URL for uploading a file into storage.

Upon a POST request to this URL, the endpoint will return a JSON object containing a newly allocated `Id<"_storage">`.

The POST URL accepts an optional standard HTTP Digest header with a sha256 checksum.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#returns-4 "Direct link to Returns")

`Promise`<`string`>

* A url that allows file upload via an HTTP POST.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#defined-in-4 "Direct link to Defined in")

[server/storage.ts:105](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L105)

---

### delete[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#delete "Direct link to delete")

▸ **delete**(`storageId`): `Promise`<`void`>

Delete a file from Convex storage.

Once a file is deleted, any URLs previously generated by [getUrl](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl) will return 404s.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file to delete from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#returns-5 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#defined-in-5 "Direct link to Defined in")

[server/storage.ts:113](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L113)

▸ **delete**<`T`>(`storageId`): `Promise`<`void`>

**`Deprecated`**

Passing a string is deprecated, use `storage.delete(Id<"_storage">)` instead.

Delete a file from Convex storage.

Once a file is deleted, any URLs previously generated by [getUrl](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl) will return 404s.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file to delete from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#returns-6 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#defined-in-6 "Direct link to Defined in")

[server/storage.ts:124](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L124)

[Previous

StorageReader](https://docs.convex.dev/api/interfaces/server.StorageReader.html)[Next

SystemDataModel](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html)

* [Hierarchy](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#methods)
  + [getUrl](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#geturl)
  + [getMetadata](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#getmetadata)
  + [generateUploadUrl](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#generateuploadurl)
  + [delete](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#delete)
