---
title: "Start building for customer accounts"
source_url: "https://shopify.dev/docs/apps/build/customer-accounts/start-building"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [General requirements](https://shopify.dev/docs/apps/build/customer-accounts/start-building#general-requirements)
* [Next steps](https://shopify.dev/docs/apps/build/customer-accounts/start-building#next-steps)

Get started building customer account UI extensions by setting up your development environment. You'll use [Shopify CLI](https://shopify.dev/docs/apps/build/cli-for-apps) to generate starter code for building your extension and automating common development tasks.

---

## [Anchor to General requirements](https://shopify.dev/docs/apps/build/customer-accounts/start-building#general-requirements)General requirements

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions) and have created a [dev store](https://shopify.dev/docs/apps/build/dev-dashboard/development-stores).

* You're using the latest version of [Shopify CLI](https://shopify.dev/docs/api/shopify-cli).
* You're using the latest version of [Chrome](https://www.google.com/chrome/) or [Firefox](https://www.mozilla.org/).

* The dev store should be pre-populated with test data, including an order that's associated with the email address you'll use to log in to the customer account experience.

* You're using the latest version of [Shopify CLI](https://shopify.dev/docs/api/shopify-cli).
* You're using the latest version of [Chrome](https://www.google.com/chrome/) or [Firefox](https://www.mozilla.org/).

### [Anchor to Steps](https://shopify.dev/docs/apps/build/customer-accounts/start-building#steps)Steps

1. Run the following command to scaffold an app:

   $

   $

   shopify app init
2. Select `Build an extension-only app`.
3. Navigate to your app directory:

   $

   $

   cd <directory>
4. Run the following command to create a new extension:

   $

   $

   shopify app generate extension --name my-extension
5. Choose `Customer account UI`.
6. Start your development server to build your app and preview your extension:

   $

   $

   shopify app dev

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/customer-accounts/start-building#next-steps)Next steps

Learn common use cases for customer account UI extensions with the following tutorials:

[![](https://shopify.dev/images/icons/48/star.png)![](https://shopify.dev/images/icons/48/star-dark.png)

Inline extensions

Build an extension that displays the loyalty points earned from an order and enables customers to leave a review.

Inline extensions

Build an extension that displays the loyalty points earned from an order and enables customers to leave a review.](/docs/apps/build/customer-accounts/inline-extensions/build-order-status)

[Inline extensions


Build an extension that displays the loyalty points earned from an order and enables customers to leave a review.](https://shopify.dev/docs/apps/build/customer-accounts/inline-extensions/build-order-status)

[![](https://shopify.dev/images/icons/48/growth.png)![](https://shopify.dev/images/icons/48/growth-dark.png)

Order action menu extensions

Build an extension on the order action menu that enables customers to report problems with their orders.

Order action menu extensions

Build an extension on the order action menu that enables customers to report problems with their orders.](/docs/apps/build/customer-accounts/order-action-extensions/build-for-order-action-menus)

[Order action menu extensions


Build an extension on the order action menu that enables customers to report problems with their orders.](https://shopify.dev/docs/apps/build/customer-accounts/order-action-extensions/build-for-order-action-menus)

[![](https://shopify.dev/images/icons/48/heart.png)![](https://shopify.dev/images/icons/48/heart-dark.png)

Full-page extensions

Build full-page extensions for customers to add and edit products on a wishlist.

Full-page extensions

Build full-page extensions for customers to add and edit products on a wishlist.](/docs/apps/build/customer-accounts/full-page-extensions/build-new-pages)

[Full-page extensions


Build full-page extensions for customers to add and edit products on a wishlist.](https://shopify.dev/docs/apps/build/customer-accounts/full-page-extensions/build-new-pages)

---

Was this page helpful?

YesNo

* [General requirements](https://shopify.dev/docs/apps/build/customer-accounts/start-building#general-requirements)
* [Next steps](https://shopify.dev/docs/apps/build/customer-accounts/start-building#next-steps)
