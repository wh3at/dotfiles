---
title: "About the Order status page"
source_url: "https://shopify.dev/docs/apps/build/customer-accounts/order-status-page"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Authentication states](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#authentication-states)
* [Limitations](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#limitations)
* [Order action menu extensions](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#order-action-menu-extensions)
* [Next steps](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#next-steps)

The **Order status** page is where customers can view, manage, and track a specific order. Customers can reach this page from order notifications, or by clicking an order on the **Order index** page. Since customers frequently check their order status, the **Order status** page is an essential part of the customer journey, and a great opportunity for building UI extensions that add useful functionality to the customer experience.

Note

[Order action menu extensions](https://shopify.dev/docs/apps/build/customer-accounts/order-action-extensions) are shared between the **Order index** and **Order status** pages, which enables customers to manage their order from either page.

---

## [Anchor to Authentication states](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#authentication-states)Authentication states

Tip

Extensions can use the [Authentication State API](https://shopify.dev/docs/api/customer-account-ui-extensions/latest/apis/order-status-api/authentication-state) to get the authentication state of the **Order status** page.

The **Order status** page supports the following authentication states:

### [Anchor to Unauthenticated state](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#unauthenticated-state)Unauthenticated state

The unauthenticated **Order status** page can be accessed by anyone who has a direct link.

When customers directly access the page, only public order data like items in the cart, order status, and order total displays. Sensitive and personally identifiable information is redacted. Because the unauthenticated **Order status** page is fully public, it doesn't support extensions. This prevents exposing sensitive information or actions.

![The unauthenticated Order status page. Sensitive order details are redacted, such as tracking number, payment information, billing and shipping addresses, company name and location, and shipping method. The estimated delivery date, order status, product line items, and price aren't redacted. There's also a card that says "Log in to view all order details" with a button that says "Log in".](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/customer-accounts/ux-guidelines/unauthenticated-osp-CBWJtsY5.png)

### [Anchor to Pre-authenticated state](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#pre-authenticated-state)Pre-authenticated state

When a customer accesses the **Order status** page from an order notification, the URL includes a token. This token provides partial authentication, which allows customers to view all data related to that order without logging in.

Customers can access the pre-authenticated **Order status** page from order notifications for 3 weeks without logging in, when using the same browser session. When using different browser sessions, customers can access the pre-authenticated **Order status** page for 2 weeks without logging in, across a maximum of 5 different browser sessions. If this limit is exceeded, the customer will see the unauthenticated **Order status** page instead, and they’ll need to log in to view the order.

In the pre-authenticated state, customers can't access customer data or data from other orders. Because of this, extensions on the pre-authenticated **Order status** page shouldn't expose any data or actions outside the scope of the order that the customer is viewing.

Caution

If you are building an app that directs customers to the pre-authenticated **Order status** page, then you need to [obtain level 2 permission for protected customer data](https://shopify.dev/docs/apps/launch/protected-customer-data).

### [Anchor to Fully authenticated state](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#fully-authenticated-state)Fully authenticated state

When customers have a valid authentication session, they are considered fully authenticated. This authentication state has no restrictions or limitations for UI extensions.

---

## [Anchor to Limitations](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#limitations)Limitations

### [Anchor to API access](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#api-access)API access

Be aware of the following API access restrictions:

* [`buyerIdentity.customer.id`](https://shopify.dev/docs/api/customer-account-ui-extensions/apis/order-status-api/buyer-identity) is only exposed to extensions when the customer is logged in. This means that in the pre-authenticated state, you can't retrieve the customer's ID. This ensures that the data that is provided to extensions on this page is relevant only to the specific order being viewed.
* [Storage](https://shopify.dev/docs/api/customer-account-ui-extensions/apis/storage) access is scoped to the customer.

  + For the pre-authenticated **Order status** page, storage access is scoped to the customer that's associated with the order.
  + For the fully authenticated **Order status** page, storage access is scoped to the authenticated customer.

### [Anchor to Customer Account API](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#customer-account-api)Customer Account API

The Customer Account API can be accessed in the fully authenticated and pre-authenticated state. In the fully authenticated state, all fields are accessible as long as the app has the required access scope. Fields with the label `pre-auth accessible` can be used in the query in the pre-authenticated state. Make sure there is a path from the query root to the field. Querying a field without the `pre-auth accessible` label, in the pre-authenticated state, can lead to an “Access denied” error.

---

## [Anchor to Order action menu extensions](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#order-action-menu-extensions)Order action menu extensions

Customers must be fully authenticated to complete order actions built with order action menu extensions.

Order action menu extensions on the pre-authenticated **Order status** page prompt the customer to log in. After logging in, customers are returned to the fully authenticated **Order status** page, where the order action is automatically resumed.

For example, when an extension intends to open a modal, the modal is opened automatically when the customer returns to the **Order status** page after logging in.

The following video demonstrates a customer clicking an order action menu extension on the pre-authenticated **Order status** page:

[

Your browser doesn't support this video.

](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/videos/apps/customer-accounts/Order-status-page-pre-auth-order-action-B9KNhEOT.webm)

Order action menu extensions on the fully authenticated **Order status** page trigger the action immediately, without prompting the customer to log in first.

The following video demonstrates a customer clicking an order action menu extension on the fully authenticated **Order status** page:

[

Your browser doesn't support this video.

](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/videos/apps/customer-accounts/Order-status-page-fully-auth-order-action-11mOYOTh.webm)

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#next-steps)Next steps

[![](https://shopify.dev/images/icons/48/pickaxe-1.png)![](https://shopify.dev/images/icons/48/pickaxe-1-dark.png)

Build pre-auth order status UI extensions

Build an extension for the pre-auth **Order status** page, which customers can access without logging in.

Build pre-auth order status UI extensions

Build an extension for the pre-auth **Order status** page, which customers can access without logging in.](/docs/apps/build/customer-accounts/pre-auth-order-status-page-extensions/build-pre-auth-order-status-page-extensions)

[Build pre-auth order status UI extensions


Build an extension for the pre-auth **Order status** page, which customers can access without logging in.](https://shopify.dev/docs/apps/build/customer-accounts/pre-auth-order-status-page-extensions/build-pre-auth-order-status-page-extensions)

[![](https://shopify.dev/images/icons/48/star.png)![](https://shopify.dev/images/icons/48/star-dark.png)

Build for order action menus

Build an order action that lets customers manage their order from the **Order index** and **Order status** pages.

Build for order action menus

Build an order action that lets customers manage their order from the **Order index** and **Order status** pages.](/docs/apps/build/customer-accounts/order-action-extensions/build-for-order-action-menus)

[Build for order action menus


Build an order action that lets customers manage their order from the **Order index** and **Order status** pages.](https://shopify.dev/docs/apps/build/customer-accounts/order-action-extensions/build-for-order-action-menus)

[![](https://shopify.dev/images/icons/48/pickaxe-2.png)![](https://shopify.dev/images/icons/48/pickaxe-2-dark.png)

Build an inline order status UI extension

Build an extension that renders between existing UI on the **Order status** page.

Build an inline order status UI extension

Build an extension that renders between existing UI on the **Order status** page.](/docs/apps/build/customer-accounts/inline-extensions/build-order-status)

[Build an inline order status UI extension


Build an extension that renders between existing UI on the **Order status** page.](https://shopify.dev/docs/apps/build/customer-accounts/inline-extensions/build-order-status)

---

Was this page helpful?

YesNo

* [Authentication states](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#authentication-states)
* [Limitations](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#limitations)
* [Order action menu extensions](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#order-action-menu-extensions)
* [Next steps](https://shopify.dev/docs/apps/build/customer-accounts/order-status-page#next-steps)
