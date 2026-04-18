---
title: "Projects | Convex Developer Hub"
source_url: "https://docs.convex.dev/dashboard/projects"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Dashboard](https://docs.convex.dev/dashboard.html)
* Projects

Copy as Markdown

Copied!

On this page

![Project settings](https://docs.convex.dev/assets/images/projects-ea1be7a1deec4ee628278d2badc15e2f.png)

A project corresponds to a codebase that uses Convex, which contains a
production deployment and one personal deployment for each team member.

Clicking on a project in the [landing page](https://dashboard.convex.dev) will
redirect you to project details.

## Creating a project[​](https://docs.convex.dev/dashboard/projects.html#creating-a-project "Direct link to Creating a project")

Projects can be created from the dashboard or from the
[CLI](https://docs.convex.dev/using/cli.html#create-a-new-project). To create a project from the dashboard
click on the Create Project button.

## Project Settings[​](https://docs.convex.dev/dashboard/projects.html#project-settings "Direct link to Project Settings")

You can access project-level settings by clicking on the triple-dot `⋮` button
on each Project card on the Projects page.

![Project card menu](https://docs.convex.dev/assets/images/project_menu-374924ad6539365422c2fe033a860807.png)

On the [Project Settings page](https://dashboard.convex.dev/project/settings),
you can:

* Update your project's name and slug.
* Manage the project's Admins. See
  [Roles and Permissions](https://docs.convex.dev/dashboard/teams.html#roles-and-permissions) for more
  details.
* View the amount of [usage metrics](https://docs.convex.dev/dashboard/teams.html#usage) your project has
  consumed.
* Add [custom domains](https://docs.convex.dev/production/hosting/custom.html#custom-domains) for your
  production deployment
* Generate deploy keys for your production and preview deployments.
* Create and edit
  [default environment variables](https://docs.convex.dev/production/environment-variables.html#project-environment-variable-defaults).
* View instructions to regain access to your project, should you lose track of
  your `CONVEX_DEPLOYMENT` config.
* Permanently delete the project.

![Project settings](https://docs.convex.dev/assets/images/project_settings-1f0b5c77c97069e4f609965071ca2759.png)

## Deleting projects[​](https://docs.convex.dev/dashboard/projects.html#deleting-projects "Direct link to Deleting projects")

To delete a project, click on the triple-dot `⋮` button on the Project card and
select "Delete". You may also delete your project from the Project Settings
page.

Once a project is deleted, it cannot be recovered. All deployments and data
associated with the project will be permanently removed. When deleting a project
from the dashboard, you will be asked to confirm the deletion. Projects with
activity in the production deployment will have additional confirmation steps to
prevent accidental deletion.

![Delete project](https://docs.convex.dev/assets/images/project_delete-6db8dd21ba528b6c7ce4063a54e2d7f0.png)

[Previous

Teams](https://docs.convex.dev/dashboard/teams.html)[Next

Deployments](https://docs.convex.dev/dashboard/deployments/index.html)

* [Creating a project](https://docs.convex.dev/dashboard/projects.html#creating-a-project)
* [Project Settings](https://docs.convex.dev/dashboard/projects.html#project-settings)
* [Deleting projects](https://docs.convex.dev/dashboard/projects.html#deleting-projects)
