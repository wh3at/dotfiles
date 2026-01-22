---
title: "Storefront performance"
source_url: "https://shopify.dev/docs/apps/build/performance/storefront"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Testing storefront performance](https://shopify.dev/docs/apps/build/performance/storefront#testing-storefront-performance)
* [Optimizing storefront performance](https://shopify.dev/docs/apps/build/performance/storefront#optimizing-storefront-performance)
* [Additional resources](https://shopify.dev/docs/apps/build/performance/storefront#additional-resources)

You should optimize your app to minimize its impact on storefront performance. A fast storefront leads to [higher conversion rates](https://www.shopify.com/enterprise/site-performance-page-speed-ecommerce), more repeat business, and better [search engine rankings](https://webmasters.googleblog.com/2020/05/evaluating-page-experience.html).

---

## [Anchor to Testing storefront performance](https://shopify.dev/docs/apps/build/performance/storefront#testing-storefront-performance)Testing storefront performance

Learn how Shopify tests the impact of your app on storefront performance, and how you can run similar tests.

### [Anchor to How Shopify tests storefront performance](https://shopify.dev/docs/apps/build/performance/storefront#how-shopify-tests-storefront-performance)How Shopify tests storefront performance

For apps that affect storefronts directly, Shopify tests the app's effect on store performance by measuring the Lighthouse score before and after the app is installed. We calculate a weighted average of score from the following pages:

The pages that are used to calculate the performance impact of apps on the storefront, and their weights.

| Page | Weight |
| --- | --- |
| Home | 17% |
| Product details | 40% |
| Collection | 43% |

The difference in the score before and after the app is installed and configured on the above pages indicates whether the app improves or worsens store performance. Your app should consistently demonstrate low or no negative impact on the performance of real merchant stores over time.

### [Anchor to Testing your app](https://shopify.dev/docs/apps/build/performance/storefront#testing-your-app)Testing your app

Use the following procedure to determine the impact of your app on storefront performance.

#### [Anchor to Step 1: Retrieve testing URLs](https://shopify.dev/docs/apps/build/performance/storefront#step-1-retrieve-testing-urls)Step 1: Retrieve testing URLs

To test your store performance, you need to retrieve a testable home page URL, product page URL, and collection page URL.

For accurate measurements, start with a clean install of a supported Shopify theme, such as [Horizon](https://themes.shopify.com/themes/horizon/presets/horizon), without your app or any other apps installed.

1. In the Shopify admin, navigate to **Online Store** > **Themes**.
2. Right click on the **View your store** button, and then select **Copy link address** from the context menu.

   This is a shareable link to your store's home page that can be accessed by PageSpeed Insights, even if your store is password-protected.

   Paste the URL into a text editor so you can use it later.

   ![Right-click on the View your store button to retrieve a URL for performance testing](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/best-practices/performance/storefront/store-preview-link-D3RbAqu5.png)

   9

   1

   https://your-store.myshopify.com/?key=f5c4757ff9e0e7b352a30856456b5a7470663ea75c1f7ddb10e385366656ecb2&preview\_theme\_id=
3. Retrieve the path to the product page that you want to test. To find the path, navigate to the product page in your browser. Copy the segment of the URL after `.myshopify.com`. This will generally be something like `/product/your-product-name`.

   To build your testable product page link, edit the home page URL that you retrieved. Paste the path to your product page into the URL between `.myshopify.com` and `?key=`:

   9

   1

   https://your-store.myshopify.com/?key=f5c4757ff9e0e7b352a30856456b5a7470663ea75c1f7ddb10e385366656ecb2&preview\_theme\_id=

   9

   1

   https://your-store.myshopify.com/product/your-product-name?key=f5c4757ff9e0e7b352a30856456b5a7470663ea75c1f7ddb10e385366656ecb2&preview\_theme\_id=
4. Retrieve the path to the collection page that you want to test. To find the path, navigate to the collection page in your browser. Copy the segment of the URL after `.myshopify.com`. This will generally be something like `/collection/your-collection-name`.

   To build your testable collection page link, edit the home page URL that you retrieved. Paste the path to your collection page into the URL between `.myshopify.com` and `?key=`:

   9

   1

   https://your-store.myshopify.com/?key=f5c4757ff9e0e7b352a30856456b5a7470663ea75c1f7ddb10e385366656ecb2&preview\_theme\_id=

   9

   1

   https://your-store.myshopify.com/collection/your-collection-name?key=f5c4757ff9e0e7b352a30856456b5a7470663ea75c1f7ddb10e385366656ecb2&preview\_theme\_id=

#### [Anchor to Step 2: Retrieve your starting performance scores](https://shopify.dev/docs/apps/build/performance/storefront#step-2-retrieve-your-starting-performance-scores)Step 2: Retrieve your starting performance scores

1. On [PageSpeed Insights](https://pagespeed.web.dev/), paste the home page URL that you retrieved in [Retrieve testing URLs](#step-1-retrieve-testing-urls).
2. Click **Analyze**.

   If PageSpeed Insights indicates that it's attempting to test using a simplified version of the URL, then click **Run with original URL**.

   ![Make sure that you test your store using the original preview URL that you copied.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/best-practices/performance/storefront/original-url-Y25vPi_e.png)
3. When the results appear, select the **Mobile** tab if it isn't already selected. Record the **Performance** score. This is your starting performance score for the store's home page.

   ![Record the mobile performance score that's returned.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/best-practices/performance/storefront/performance-score-Bkx3-F_o.png)
4. Repeat steps one through three for your product page and collection page URLs.
5. Now that you have a starting performance score for your home, product, and collection pages, calculate the weighted average performance score using the [weights for each page type](https://shopify.dev/docs/apps/build/performance/storefront#how-shopify-tests-storefront-performance). You can do this using a [weighted average calculator](https://www.rapidtables.com/calc/math/weighted-average-calculator.html).

Note

Lighthouse scores can vary between runs. Consider running these tests frequently during your development, and averaging your scores across a few consecutive Lighthouse tests before submission.

#### [Anchor to Step 3: Retrieve your ending performance score and calculate your performance impact](https://shopify.dev/docs/apps/build/performance/storefront#step-3-retrieve-your-ending-performance-score-and-calculate-your-performance-impact)Step 3: Retrieve your ending performance score and calculate your performance impact

1. Install your app on your test store. Configure the most frequently used app features with typical required assets. Verify that it loads correctly and that you're able to preview it on the storefront.
2. On [PageSpeed Insights](https://pagespeed.web.dev/), repeat the steps from [Retrieve starting performance scores](#step-2-retrieve-starting-performance-scores).
3. Using the three ending performance scores that you retrieved, calculate the weighted average performance score using the [weights for each page type](https://shopify.dev/docs/apps/build/performance/storefront#how-shopify-tests-storefront-performance).
4. Subtract your starting performance score from your ending performance score. This is the impact on Lighthouse performance score due to your app. For example:

   * Starting performance score: **92**
   * Ending performance score: **87**

The ending performance score (87) minus starting performance score (92) equals -5, so the final speed score impact of your app is -5 points.

---

## [Anchor to Optimizing storefront performance](https://shopify.dev/docs/apps/build/performance/storefront#optimizing-storefront-performance)Optimizing storefront performance

Learn how to optimize your app's storefront performance.

### [Anchor to Use theme app extensions](https://shopify.dev/docs/apps/build/performance/storefront#use-theme-app-extensions)Use theme app extensions

Theme app extensions allow developers to extend themes in a way that protects theme code integrity and provides better app development and user experiences.

Apps built using the [theme app extension framework](https://shopify.dev/docs/apps/build/online-store/theme-app-extensions/configuration) don't edit theme code, which decreases the risk of introducing breaking changes to the theme, makes it easier to iterate on the content of the integration, and provides for a better user experience.

All files inside the `assets/` folder are automatically served from [the Shopify CDN](#host-assets-on-shopify-servers) for fast, reliable asset delivery. Reference your assets by using either the `javascript` and `stylesheet` [schema attributes](https://shopify.dev/docs/apps/build/online-store/theme-app-extensions/configuration#schema) or using the [`asset_url`](https://shopify.dev/docs/api/liquid/filters/asset_url) and [`asset_img_url`](https://shopify.dev/docs/api/liquid/filters/asset_img_url) Liquid URL filters.

Use [app embed blocks](https://shopify.dev/docs/apps/build/online-store/theme-app-extensions/configuration#app-embed-blocks) to take advantage of their ability to only load scripts on specific pages. This minimizes your app's performance impact by only loading resources where they're needed.

### [Anchor to Host assets on Shopify servers](https://shopify.dev/docs/apps/build/performance/storefront#host-assets-on-shopify-servers)Host assets on Shopify servers

Deliver as much as you can from the Shopify content delivery network (CDN). Using the same host for your assets avoids unnecessary HTTP connections and allows the server to prioritize delivery of blocking resources using HTTP/2 prioritization.

In a Shopify context, you can do this by using the `file`[GraphQL resource](https://shopify.dev/docs/api/admin-graphql/latest/interfaces/file) to host your static files on Shopify's servers and have them delivered by our globally available CDN.

CDNs are accelerated web servers with built-in caching, compression, fast performance, and global distribution. Using Shopify’s CDN also reduces network congestion.

Learn more about [using Shopify CDN for better performance](https://performance.shopify.com/blogs/blog/using-shopify-cdn-for-better-performance).

---

## [Anchor to Additional resources](https://shopify.dev/docs/apps/build/performance/storefront#additional-resources)Additional resources

To learn more about optimizing for storefront performance, review the following guides on our web performance blog:

* [Optimize your images for a Shopify storefront using the Liquid template language](https://performance.shopify.com/blogs/blog/responsive-images-on-shopify-with-liquid)
* [Improve performance by removing image transitions](https://performance.shopify.com/blogs/blog/improve-largest-contentful-paint-lcp-by-removing-image-transitions)
* [Lazy loading images](https://performance.shopify.com/blogs/blog/lazy-load-images-for-performance)
* [Preconnecting and preloading resource hints](https://performance.shopify.com/blogs/blog/introduction-to-resource-hints)

---

Was this page helpful?

YesNo

* [Testing storefront performance](https://shopify.dev/docs/apps/build/performance/storefront#testing-storefront-performance)
* [Optimizing storefront performance](https://shopify.dev/docs/apps/build/performance/storefront#optimizing-storefront-performance)
* [Additional resources](https://shopify.dev/docs/apps/build/performance/storefront#additional-resources)
