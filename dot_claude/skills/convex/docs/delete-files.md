---
title: "Deleting Files | Convex Developer Hub"
source_url: "https://docs.convex.dev/file-storage/delete-files"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [File Storage](https://docs.convex.dev/file-storage.html)
* Delete

Copy as Markdown

Copied!

Files stored in Convex can be deleted from
[mutations](https://docs.convex.dev/functions/mutation-functions.html),
[actions](https://docs.convex.dev/functions/actions.html), and
[HTTP actions](https://docs.convex.dev/functions/http-actions.html) via the
[`storage.delete()`](https://docs.convex.dev/api/interfaces/server.StorageWriter.html#delete) function,
which accepts a storage ID.

Storage IDs correspond to documents in the `"_storage"` system table (see
[Metadata](https://docs.convex.dev/file-storage/file-metadata.html)), so they can be validated using the
`v.id("_storage")`.

convex/images.ts

TS

```
import { v } from "convex/values";
import { Id } from "./_generated/dataModel";
import { mutation } from "./_generated/server";

export const deleteById = mutation({
  args: {
    storageId: v.id("_storage"),
  },
  handler: async (ctx, args) => {
    return await ctx.storage.delete(args.storageId);
  },
});
```

[Previous

Serve](https://docs.convex.dev/file-storage/serve-files.html)[Next

Metadata](https://docs.convex.dev/file-storage/file-metadata.html)
