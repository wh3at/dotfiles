---
title: "Interface: StorageActionWriter | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.StorageActionWriter"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* StorageActionWriter

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).StorageActionWriter

An interface to read and write files to storage within Convex actions and HTTP actions.

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#hierarchy "Direct link to Hierarchy")

* [`StorageWriter`](https://docs.convex.dev/api/interfaces/server.StorageWriter.html)

  ↳ **`StorageActionWriter`**

## Methods[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#methods "Direct link to Methods")

### getUrl[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#geturl "Direct link to getUrl")

▸ **getUrl**(`storageId`): `Promise`<`null` | `string`>

Get the URL for a file in storage by its `Id<"_storage">`.

The GET response includes a standard HTTP Digest header with a sha256 checksum.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file to fetch from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns "Direct link to Returns")

`Promise`<`null` | `string`>

* A url which fetches the file via an HTTP GET, or `null` if it no longer exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#inherited-from "Direct link to Inherited from")

[StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html).[getUrl](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#geturl)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in "Direct link to Defined in")

[server/storage.ts:51](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L51)

▸ **getUrl**<`T`>(`storageId`): `Promise`<`null` | `string`>

**`Deprecated`**

Passing a string is deprecated, use `storage.getUrl(Id<"_storage">)` instead.

Get the URL for a file in storage by its [StorageId](https://docs.convex.dev/api/modules/server.html#storageid).

The GET response includes a standard HTTP Digest header with a sha256 checksum.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file to fetch from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-1 "Direct link to Returns")

`Promise`<`null` | `string`>

* A url which fetches the file via an HTTP GET, or `null` if it no longer exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#inherited-from-1 "Direct link to Inherited from")

[StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html).[getUrl](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#geturl)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-1 "Direct link to Defined in")

[server/storage.ts:63](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L63)

---

### getMetadata[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#getmetadata "Direct link to getMetadata")

▸ **getMetadata**(`storageId`): `Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

**`Deprecated`**

This function is deprecated, use `db.system.get(Id<"_storage">)` instead.

Get metadata for a file.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-2 "Direct link to Returns")

`Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

* A [FileMetadata](https://docs.convex.dev/api/modules/server.html#filemetadata) object if found or `null` if not found.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#inherited-from-2 "Direct link to Inherited from")

[StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html).[getMetadata](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#getmetadata)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-2 "Direct link to Defined in")

[server/storage.ts:75](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L75)

▸ **getMetadata**<`T`>(`storageId`): `Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

**`Deprecated`**

This function is deprecated, use `db.system.get(Id<"_storage">)` instead.

Get metadata for a file.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-3 "Direct link to Returns")

`Promise`<`null` | [`FileMetadata`](https://docs.convex.dev/api/modules/server.html#filemetadata)>

* A [FileMetadata](https://docs.convex.dev/api/modules/server.html#filemetadata) object if found or `null` if not found.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#inherited-from-3 "Direct link to Inherited from")

[StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html).[getMetadata](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#getmetadata)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-3 "Direct link to Defined in")

[server/storage.ts:85](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L85)

---

### generateUploadUrl[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#generateuploadurl "Direct link to generateUploadUrl")

▸ **generateUploadUrl**(): `Promise`<`string`>

Fetch a short-lived URL for uploading a file into storage.

Upon a POST request to this URL, the endpoint will return a JSON object containing a newly allocated `Id<"_storage">`.

The POST URL accepts an optional standard HTTP Digest header with a sha256 checksum.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-4 "Direct link to Returns")

`Promise`<`string`>

* A url that allows file upload via an HTTP POST.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#inherited-from-4 "Direct link to Inherited from")

[StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html).[generateUploadUrl](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#generateuploadurl)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-4 "Direct link to Defined in")

[server/storage.ts:105](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L105)

---

### delete[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#delete "Direct link to delete")

▸ **delete**(`storageId`): `Promise`<`void`>

Delete a file from Convex storage.

Once a file is deleted, any URLs previously generated by [getUrl](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl) will return 404s.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> | The `Id<"_storage">` of the file to delete from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-5 "Direct link to Returns")

`Promise`<`void`>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#inherited-from-5 "Direct link to Inherited from")

[StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html).[delete](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#delete)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-5 "Direct link to Defined in")

[server/storage.ts:113](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L113)

▸ **delete**<`T`>(`storageId`): `Promise`<`void`>

**`Deprecated`**

Passing a string is deprecated, use `storage.delete(Id<"_storage">)` instead.

Delete a file from Convex storage.

Once a file is deleted, any URLs previously generated by [getUrl](https://docs.convex.dev/api/interfaces/server.StorageReader.html#geturl) will return 404s.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` | The [StorageId](https://docs.convex.dev/api/modules/server.html#storageid) of the file to delete from Convex storage. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-6 "Direct link to Returns")

`Promise`<`void`>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#inherited-from-6 "Direct link to Inherited from")

[StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html).[delete](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#delete)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-6 "Direct link to Defined in")

[server/storage.ts:124](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L124)

---

### get[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#get "Direct link to get")

▸ **get**(`storageId`): `Promise`<`null` | `Blob`>

Get a Blob containing the file associated with the provided `Id<"_storage">`, or `null` if there is no file.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-6 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `storageId` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-7 "Direct link to Returns")

`Promise`<`null` | `Blob`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-7 "Direct link to Defined in")

[server/storage.ts:138](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L138)

▸ **get**<`T`>(`storageId`): `Promise`<`null` | `Blob`>

**`Deprecated`**

Passing a string is deprecated, use `storage.get(Id<"_storage">)` instead.

Get a Blob containing the file associated with the provided [StorageId](https://docs.convex.dev/api/modules/server.html#storageid), or `null` if there is no file.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-7 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `storageId` | `T` extends { `__tableName`: `any` } ? `never` : `T` |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-8 "Direct link to Returns")

`Promise`<`null` | `Blob`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-8 "Direct link to Defined in")

[server/storage.ts:145](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L145)

---

### store[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#store "Direct link to store")

▸ **store**(`blob`, `options?`): `Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`>>

Store the file contained in the Blob.

If provided, this will verify the sha256 checksum matches the contents of the file.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#parameters-8 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `blob` | `Blob` |
| `options?` | `Object` |
| `options.sha256?` | `string` |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#returns-9 "Direct link to Returns")

`Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`>>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#defined-in-9 "Direct link to Defined in")

[server/storage.ts:153](https://github.com/get-convex/convex-js/blob/main/src/server/storage.ts#L153)

[Previous

SearchIndexConfig](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html)[Next

StorageReader](https://docs.convex.dev/api/interfaces/server.StorageReader.html)

* [Hierarchy](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#methods)
  + [getUrl](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#geturl)
  + [getMetadata](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#getmetadata)
  + [generateUploadUrl](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#generateuploadurl)
  + [delete](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#delete)
  + [get](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#get)
  + [store](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#store)
