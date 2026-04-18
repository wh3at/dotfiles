---
title: "Checkout performance"
source_url: "https://shopify.dev/docs/apps/build/performance/checkout"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Limit calls to retrieve carrier rates](https://shopify.dev/docs/apps/build/performance/checkout#limit-calls-to-retrieve-carrier-rates)
* [Parallelize and set timeouts for calls to external systems](https://shopify.dev/docs/apps/build/performance/checkout#parallelize-and-set-timeouts-for-calls-to-external-systems)
* [Optimize server hosting](https://shopify.dev/docs/apps/build/performance/checkout#optimize-server-hosting)
* [Implement backup rates](https://shopify.dev/docs/apps/build/performance/checkout#implement-backup-rates)

These guidelines apply only to apps that provide live shipping rates at checkout.

The response time of your shipping app impacts a customer's experience at checkout, and therefore, the app user's success. You can improve the response time of your app by limiting and optimizing calls to external systems, optimizing your app's hosting, and storing backup carrier rates to avoid blocking the checkout.

Tip

Apps that have a fast response time and low error rate, and meet other applicable criteria, are eligible for [Built for Shopify](https://shopify.dev/docs/apps/launch/built-for-shopify) status in the Shopify App Store.

---

## [Anchor to Limit calls to retrieve carrier rates](https://shopify.dev/docs/apps/build/performance/checkout#limit-calls-to-retrieve-carrier-rates)Limit calls to retrieve carrier rates

Many shipping rate apps aggregate rates for multiple shipping carriers so they can offer users rate shopping functionality. To increase performance, you should limit or eliminate external calls to carriers to retrieve these rates.

If carrier retail rates are stable, then you can store them internally to avoid external calls. For carrier rates that are dynamic or user-specific, consider caching.

### [Anchor to Cache carrier rates](https://shopify.dev/docs/apps/build/performance/checkout#cache-carrier-rates)Cache carrier rates

For carrier rates that are dynamic or user-specific, consider building a caching layer for carrier rates.

While not every call to a given carrier will result in the same response, you can identify common response patterns and, based on the pattern, define a cache key.

For example, if a carrier responds with identical shipping rates for a specific origin postal code, destination postal code, and total weight, you can create a matching cache pattern and key:

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

{

destination\_address: {

country\_code: "CA",

province\_code: "QC",

city: "Montreal",

address1: "address 1",

address2: "address 2",

address3: "address 3",

postal\_code: "K2K2K2"

},

origin\_address: {

country\_code: "CA",

province\_code: "ON",

city: "Toronto",

address1: "address 1",

address2: "address 2",

address3: "address 3",

postal\_code: "C3C3C3"

},

items: [

{

id: 1,

name: 'item1',

weight: 1

}

]

}

9

1

#{carrier\_name}\_#{origin\_postal\_code}\_#{destination\_postal\_code}\_#{total\_items\_weight}

9

1

shopify\_post\_C3C3C3\_K2K2K2\_1

Your implementation might look like the following:

1. Analyze external call response data, and identify any patterns across various use cases.
2. Store responses for similar requests in a memory database, such as [Redis](https://redis.io/), so that the cache can be retrieved quickly when new requests come in.
3. When requests hit the cache, consider making an external request in the background to validate the accuracy of the cache, and update it with new information if required.
4. Analyze your cache hit and miss ratio, and the frequency of response changes for the same requests.

---

## [Anchor to Parallelize and set timeouts for calls to external systems](https://shopify.dev/docs/apps/build/performance/checkout#parallelize-and-set-timeouts-for-calls-to-external-systems)Parallelize and set timeouts for calls to external systems

If calls to external systems such as carriers can't be avoided, and you're fetching rates from multiple external systems, then you should make calls to external systems in parallel to reduce the overall response time.

When you parallelize calls, your app's response time will be at least as long as the slowest response time. To avoid a timeout, and to avoid blocking the Shopify checkout, you should set an internal timeout that cancels your request to the external system if it fails to respond. You can then return a subset of shipping rates to Shopify so the customer can proceed with checkout.

---

## [Anchor to Optimize server hosting](https://shopify.dev/docs/apps/build/performance/checkout#optimize-server-hosting)Optimize server hosting

Part of your overall response time is latency between your app server and Shopify servers.

The impact of latency varies between regions. Shopify servers are hosted on Google Cloud. Different levels of latency apply by region. To learn more, refer to the [Google Cloud inter-region latency matrix](https://datastudio.google.com/u/0/reporting/fc733b10-9744-4a72-a502-92290f608571/page/70YCB).

You can use [cURL](https://curl.se/) to calculate your request and response time and understand the impact of hosting:

1. Create new file called `curl-format.txt` with the following content:

   9

   1

   2

   3

   4

   5

   6

   7

   8

   time\_namelookup: %{time\_namelookup}s\n

   time\_connect: %{time\_connect}s\n

   time\_appconnect: %{time\_appconnect}s\n

   time\_pretransfer: %{time\_pretransfer}s\n

   time\_redirect: %{time\_redirect}s\n

   time\_starttransfer: %{time\_starttransfer}s\n

   ----------\n

   time\_total: %{time\_total}s\n
2. In a terminal, run the following command, where `http://url/` is the address of one of the Shopify stores your application is installed on. The command returns timings for your request:

   $

   $

   curl -w "@curl-format.txt" -o /dev/null -s "http://url/"

   9

   1

   2

   3

   4

   5

   6

   7

   8

   time\_namelookup: 0.326604s

   time\_connect: 0.467748s

   time\_appconnect: 0.000000s

   time\_pretransfer: 0.467986s

   time\_redirect: 0.000000s

   time\_starttransfer: 0.584812s

   ----------

   time\_total: 0.584852s

   Repeat this step with stores that are located in different regions.

If your connection time is significantly higher than the Google Cloud inter-region latency, then consider the following actions:

* Change your hosting provider to Google Cloud to take advantage of an optimized infrastructure.
* Move your application to a region closer to the majority of Shopify stores using your application.

---

## [Anchor to Implement backup rates](https://shopify.dev/docs/apps/build/performance/checkout#implement-backup-rates)Implement backup rates

To avoid blocking the checkout when a call to an external system times out or otherwise fails, you should implement backup rates for your shipping rate app. You should store these rates somewhere they can be quickly fetched when needed. These backup rates can act as an alternative to [Shopify backup rates](https://help.shopify.com/manual/shipping/setting-up-and-managing-your-shipping/backup-shipping-rates), when a user has them enabled. Implementing backup rates specific to your app leads to a better app user and customer experience, as rates are closer to those returned by your app.

Backup rates don't need to match external carrier rates exactly, but should be close enough to avoid significantly impacting profitability and conversion. To make your backup rates as accurate as possible, you can base them on historic rates that you've received from carriers.

You can implement backup rates using the following steps:

1. Define logic for your backup rates. For example, you might store one expensive and fast and one cheap and slow shipping rate for a given city or country, for a given weight range, or for a given size range.
2. Analyze the response data from external systems to determine the backup rates for each logical grouping.
3. Store the backup rates in an easily accessible datastore. The datastore should be able to return the rates quickly.

The following is an example set of backup rates for domestic orders in Canada. Rates differ based on order weight only.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

rate\_definitions:

-

name: Standard

price: 0

currency: CAD

rate\_class\_id: 10

conditions:

-

field: total\_price

criteria: 100

criteria\_unit: CAD

operator: greater\_than\_or\_equal\_to

-

name: Standard

price: 14.90

currency: CAD

conditions:

-

field: total\_weight

criteria: 2.0

criteria\_unit: kg

operator: less\_than\_or\_equal\_to

-

name: Standard

price: 21.90

currency: CAD

conditions:

-

field: total\_weight

criteria: 2.0

criteria\_unit: kg

operator: greater\_than\_or\_equal\_to

-

field: total\_weight

criteria: 30.0

criteria\_unit: kg

operator: less\_than\_or\_equal\_to

-

name: Express

price: 21.90

currency: CAD

conditions:

-

field: total\_weight

criteria: 2.0

criteria\_unit: kg

operator: less\_than\_or\_equal\_to

---

Was this page helpful?

YesNo

* [Limit calls to retrieve carrier rates](https://shopify.dev/docs/apps/build/performance/checkout#limit-calls-to-retrieve-carrier-rates)
* [Parallelize and set timeouts for calls to external systems](https://shopify.dev/docs/apps/build/performance/checkout#parallelize-and-set-timeouts-for-calls-to-external-systems)
* [Optimize server hosting](https://shopify.dev/docs/apps/build/performance/checkout#optimize-server-hosting)
* [Implement backup rates](https://shopify.dev/docs/apps/build/performance/checkout#implement-backup-rates)
