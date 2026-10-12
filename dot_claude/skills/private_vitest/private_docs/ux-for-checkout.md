---
title: "UX for checkout"
source_url: "https://shopify.dev/docs/apps/build/checkout/ux-for-checkout"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Maintain trust](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#maintain-trust)
* [Reduce friction](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#reduce-friction)
* [Test different scenarios](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#test-different-scenarios)
* [Additional UX guidelines](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#additional-ux-guidelines)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#next-steps)

Checkout is the most critical step of the customer journey. Checkout should help customers feel in control and confident about their purchases. Use our UX guidelines when you're designing your checkout experiences to ensure that they're trustworthy, efficient, and considerate.

Note

Checkout apps and extensions have [design requirements](https://shopify.dev/docs/apps/launch/app-requirements-checklist#design-requirements-for-checkout-apps) that apply to custom apps as well as public apps. Be sure that your app meets [all requirements](https://shopify.dev/docs/apps/launch/app-requirements-checklist) for its functionality and distribution type.

---

## [Anchor to Maintain trust](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#maintain-trust)Maintain trust

Customers should understand why they need to input personal information, and what will happen when they take an action. This builds trust between a customer and the merchant.

**Example**: Make it clear if an item costs money. Customers could miss this information if it's hidden among other content.

![An example what not to do, which shows a gift wrapping option where the price is included in the description. An example of what to do for this scenario, where the price for the gift wrapping option displays clearly next to the button for adding this option](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/checkout/ux-guidelines/checkout-ux-guidelines-trust-01-B0mrVg09.png)

**Example**: When checking out requires the customer to supply personal information, let them know why.

![An example of what not to do, which shows a request for the customer date of birth. An example of what to do for this scenario, where the UI indicates that date of birth is required to purchase alcohol](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/checkout/ux-guidelines/checkout-ux-guidelines-trust-02-D8MIpuco.png)

---

## [Anchor to Reduce friction](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#reduce-friction)Reduce friction

Friction in checkout can have an impact on checkout conversion. To reduce friction, [localize](https://shopify.dev/docs/apps/build/checkout/localized-checkout-ui-extensions) your experiences, write [effective content](https://polaris.shopify.com/content/merchant-to-customer), and only show components when you know that customers need them.

Note

Localization is only supported for checkout UI extensions. Localization for post-purchase extensions isn't supported. Shopify Functions also have [support for localization](https://shopify.dev/docs/apps/build/functions/localization-practices-shopify-functions).

**Example**: Show options when you know that customers need them.

[](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/videos/apps/checkout/ux-guidelines/checkout-ux-guidelines-friction-01-BIY-9i0q.webm)

**Example**: Help customers understand what's optional.

![An example of marking a field to Redeem points as optional](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/checkout/ux-guidelines/checkout-ux-guidelines-friction-02-tQbw4RoG.png)

---

## [Anchor to Test different scenarios](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#test-different-scenarios)Test different scenarios

Although you might use a desktop while developing, the majority of customers make purchases on mobile devices. Many customers also use accelerated checkout options, like Shop Pay, which pre-fill the checkout with vaulted information. [Test your extension](https://shopify.dev/docs/apps/build/checkout/test-checkout-ui-extensions) to ensure that it behaves as desired in these scenarios.

The following are some examples that you can test for:

* Mobile and desktop
* Guest checkout and Shop Pay
* Physical, digital, and discounted products
* Ship and pickup delivery methods

  **Example**: [Checkout UI extension targets](https://shopify.dev/docs/api/checkout-ui-extensions/latest/extension-targets-overview) might change location between guest checkout and Shop Pay.

  ![Checkout UI targets adapting for guest checkout and ShopPay](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/checkout/ux-guidelines/checkout-ux-guidelines-test-01-oO1AFBUJ.png)

---

## [Anchor to Additional UX guidelines](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#additional-ux-guidelines)Additional UX guidelines

Consult the following UX guidelines to learn how to build specific experiences in Shopify checkout:

[![](https://shopify.dev/images/icons/48/star.png)![](https://shopify.dev/images/icons/48/star-dark.png)

UX for pre-purchase product offers

Explore UX guidelines that you can refer to when building pre-purchase product offers.

UX for pre-purchase product offers

Explore UX guidelines that you can refer to when building pre-purchase product offers.](/docs/apps/build/checkout/product-offers/ux-for-pre-purchase-product-offers)

[UX for pre-purchase product offers


Explore UX guidelines that you can refer to when building pre-purchase product offers.](https://shopify.dev/docs/apps/build/checkout/product-offers/ux-for-pre-purchase-product-offers)

[![](https://shopify.dev/images/icons/48/growth.png)![](https://shopify.dev/images/icons/48/growth-dark.png)

UX guidelines for custom fields

Explore UX guidelines that you can refer to when building custom fields.

UX guidelines for custom fields

Explore UX guidelines that you can refer to when building custom fields.](/docs/apps/build/checkout/fields-banners/ux-for-fields)

[UX guidelines for custom fields


Explore UX guidelines that you can refer to when building custom fields.](https://shopify.dev/docs/apps/build/checkout/fields-banners/ux-for-fields)

[![](https://shopify.dev/images/icons/48/coin.png)![](https://shopify.dev/images/icons/48/coin-dark.png)

UX guidelines for payment customizations

Explore UX guidelines that you can refer to when building payment customizations.

UX guidelines for payment customizations

Explore UX guidelines that you can refer to when building payment customizations.](/docs/apps/build/checkout/payments/ux-for-payments)

[UX guidelines for payment customizations


Explore UX guidelines that you can refer to when building payment customizations.](https://shopify.dev/docs/apps/build/checkout/payments/ux-for-payments)

[![](https://shopify.dev/images/icons/48/globe.png)![](https://shopify.dev/images/icons/48/globe-dark.png)

UX guidelines for delivery customizations

Explore UX guidelines that you can refer to when building delivery customizations.

UX guidelines for delivery customizations

Explore UX guidelines that you can refer to when building delivery customizations.](/docs/apps/build/checkout/delivery-shipping/delivery-options/ux-for-delivery-options)

[UX guidelines for delivery customizations


Explore UX guidelines that you can refer to when building delivery customizations.](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/ux-for-delivery-options)

[![](https://shopify.dev/images/icons/48/custom-storefronts.png)![](https://shopify.dev/images/icons/48/custom-storefronts-dark.png)

UX guidelines for Thank you and Order status extensions

Explore UX guidelines that you can refer to when building UI extensions for the **Thank you** and **Order status** pages.

UX guidelines for Thank you and Order status extensions

Explore UX guidelines that you can refer to when building UI extensions for the **Thank you** and **Order status** pages.](/docs/apps/build/checkout/thank-you-order-status/ux-for-thank-you-order-status)

[UX guidelines for Thank you and Order status extensions


Explore UX guidelines that you can refer to when building UI extensions for the **Thank you** and **Order status** pages.](https://shopify.dev/docs/apps/build/checkout/thank-you-order-status/ux-for-thank-you-order-status)

[![](https://shopify.dev/images/icons/48/cart.png)![](https://shopify.dev/images/icons/48/cart-dark.png)

UX guidelines for announcement bar extensions

Explore UX guidelines that you can refer to when building UI extensions for the announcement bar on the **Thank you** and **customer account** pages.

UX guidelines for announcement bar extensions

Explore UX guidelines that you can refer to when building UI extensions for the announcement bar on the **Thank you** and **customer account** pages.](/docs/apps/build/checkout/thank-you-order-status/ux-for-announcement-bar)

[UX guidelines for announcement bar extensions


Explore UX guidelines that you can refer to when building UI extensions for the announcement bar on the **Thank you** and **customer account** pages.](https://shopify.dev/docs/apps/build/checkout/thank-you-order-status/ux-for-announcement-bar)

[![](https://shopify.dev/images/icons/48/heart.png)![](https://shopify.dev/images/icons/48/heart-dark.png)

UX for post-purchase product offers

Explore UX guidelines for post-purchase upsells.

UX for post-purchase product offers

Explore UX guidelines for post-purchase upsells.](/docs/apps/build/checkout/product-offers/ux-for-post-purchase-product-offers)

[UX for post-purchase product offers


Explore UX guidelines for post-purchase upsells.](https://shopify.dev/docs/apps/build/checkout/product-offers/ux-for-post-purchase-product-offers)

[![](https://shopify.dev/images/icons/48/heart.png)![](https://shopify.dev/images/icons/48/heart-dark.png)

UX for post-purchase subscriptions

Explore UX guidelines for post-purchase subscriptions.

UX for post-purchase subscriptions

Explore UX guidelines for post-purchase subscriptions.](/docs/apps/build/checkout/product-offers/ux-for-post-purchase-subscriptions)

[UX for post-purchase subscriptions


Explore UX guidelines for post-purchase subscriptions.](https://shopify.dev/docs/apps/build/checkout/product-offers/ux-for-post-purchase-subscriptions)

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#next-steps)Next steps

* For practical guidance on how to design a user interface for the Shopify admin, refer to Shopify's [App Design Guidelines](https://shopify.dev/docs/apps/design-guidelines).
* Get familiar with Polaris [accessibility](https://polaris.shopify.com/foundations/accessibility) and [content](https://polaris.shopify.com/content/merchant-to-customer) guidelines.

---

Was this page helpful?

YesNo

* [Maintain trust](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#maintain-trust)
* [Reduce friction](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#reduce-friction)
* [Test different scenarios](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#test-different-scenarios)
* [Additional UX guidelines](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#additional-ux-guidelines)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/ux-for-checkout#next-steps)
