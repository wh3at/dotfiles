---
title: "Data Import & Export | Convex Developer Hub"
source_url: "https://docs.convex.dev/database/import-export"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Database](https://docs.convex.dev/database.html)
* Data Import & Export

Copy as Markdown

Copied!

If you're bootstrapping your app from existing data, Convex provides three ways
to get the data in:

* Import from csv/json into a single table via the
  [CLI](https://docs.convex.dev/database/import-export/import.html#single-table-import).
* Restore from a backup via the [dashboard](https://docs.convex.dev/database/backup-restore.html) or
  [CLI](https://docs.convex.dev/database/import-export/import.html#restore-data-from-a-backup-zip-file).
* [Streaming import](https://docs.convex.dev/production/integrations/streaming-import-export.html) from
  any existing database via Airbyte destination connector.

You can export data from Convex in two ways.

* Download a backup as a zip from the [dashboard](https://docs.convex.dev/database/backup-restore.html).
* Set up [streaming export](https://docs.convex.dev/production/integrations/streaming-import-export.html)
  to any external database via Fivetran or Airbyte. Great for connecting to a
  custom BI setup (eg [Snowflake](https://www.snowflake.com/),
  [Databricks](https://www.databricks.com), or
  [BigQuery](https://cloud.google.com/bigquery)):

Data Import & Export is in beta

Data Import & Export is currently a [beta
feature](https://docs.convex.dev/production/state/index.html#beta-features). If you have feedback or feature
requests, [let us know on Discord](https://convex.dev/community)!

[Previous

Backup & Restore](https://docs.convex.dev/database/backup-restore.html)[Next

Data Export](https://docs.convex.dev/database/import-export/export.html)
