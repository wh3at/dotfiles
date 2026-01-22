---
title: "System Tables | Convex Developer Hub"
source_url: "https://docs.convex.dev/database/advanced/system-tables"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Database](https://docs.convex.dev/database.html)
* Advanced
* System Tables

Copy as Markdown

Copied!

System tables enable read-only access to metadata for built-in Convex features.
Currently there are two system tables exposed:

* `"_scheduled_functions"` table contains metadata for
  [scheduled functions](https://docs.convex.dev/scheduling/scheduled-functions.html#retrieving-scheduled-function-status)
* `"_storage"` table contains metadata for
  [stored files](https://docs.convex.dev/file-storage/file-metadata.html)

You can read data from system tables using the `db.system.get` and
`db.system.query` methods, which work the same as the standard `db.get` and
`db.query` methods. Queries reading from system tables are reactive and realtime
just like queries reading from all other tables, and pagination can be used to
enumerate all documents even when there are too many to read in a single query.

[Previous

Data Import](https://docs.convex.dev/database/import-export/import.html)[Next

Schema Philosophy](https://docs.convex.dev/database/advanced/schema-philosophy.html)
