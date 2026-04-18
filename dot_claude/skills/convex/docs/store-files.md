---
title: "Storing Generated Files | Convex Developer Hub"
source_url: "https://docs.convex.dev/file-storage/store-files"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [File Storage](https://docs.convex.dev/file-storage.html)
* Store

Copy as Markdown

Copied!

On this page

Files can be uploaded to Convex from a client and stored directly, see
[Upload](https://docs.convex.dev/file-storage/upload-files.html).

Alternatively files can also be stored after they've been fetched or generated
in [actions](https://docs.convex.dev/functions/actions.html) and
[HTTP actions](https://docs.convex.dev/functions/http-actions.html). For example you might call a
third-party API to generate an image based on a user prompt and then store that
image in Convex.

**Example:**
[Dall-E Storage & Action](https://github.com/get-convex/convex-demos/tree/main/dall-e-storage-action)

## Storing files in actions[​](https://docs.convex.dev/file-storage/store-files.html#storing-files-in-actions "Direct link to Storing files in actions")

Storing files in actions is similar to
[uploading a file via an HTTP action](https://docs.convex.dev/file-storage/upload-files.html#uploading-files-via-an-http-action).

The action takes these steps:

1. Fetch or generate an image.
2. Store the image using
   [`storage.store()`](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html#store) and
   receive a storage ID.
3. Save the storage ID into your data model via a mutation.

Storage IDs correspond to documents in the `"_storage"` system table (see
[Metadata](https://docs.convex.dev/file-storage/file-metadata.html)), so they can be validated using the
`v.id("_storage")` validator and typed as `Id<"_storage">` in TypeScript.

convex/images.ts

TS

```
import { action, internalMutation, query } from "./_generated/server";
import { internal } from "./_generated/api";
import { v } from "convex/values";
import { Id } from "./_generated/dataModel";

export const generateAndStore = action({
  args: { prompt: v.string() },
  handler: async (ctx, args) => {
    // Not shown: generate imageUrl from `prompt`
    const imageUrl = "https://....";

    // Download the image
    const response = await fetch(imageUrl);
    const image = await response.blob();

    // Store the image in Convex
    const storageId: Id<"_storage"> = await ctx.storage.store(image);

    // Write `storageId` to a document
    await ctx.runMutation(internal.images.storeResult, {
      storageId,
      prompt: args.prompt,
    });
  },
});

export const storeResult = internalMutation({
  args: {
    storageId: v.id("_storage"),
    prompt: v.string(),
  },
  handler: async (ctx, args) => {
    const { storageId, prompt } = args;
    await ctx.db.insert("images", { storageId, prompt });
  },
});
```

[Previous

Upload](https://docs.convex.dev/file-storage/upload-files.html)[Next

Serve](https://docs.convex.dev/file-storage/serve-files.html)

* [Storing files in actions](https://docs.convex.dev/file-storage/store-files.html#storing-files-in-actions)
