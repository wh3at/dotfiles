---
title: "asyncDefaultReportMessage | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [asyncDefaultReportMessage](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html)

# Function asyncDefaultReportMessage

* asyncDefaultReportMessage<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets)>(
      out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets)> & { failed: false },
  ): Promise<undefined>

  Format output of [check](https://fast-check.dev/api-reference/functions/check.html) using the default error reporting of [assert](https://fast-check.dev/api-reference/functions/assert.html)

  Produce a string containing the formated error in case of failed run,
  undefined otherwise.

  #### Type Parameters

  + Ts

  #### Parameters

  + out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets)> & { failed: false }

  #### Returns Promise<undefined>

  #### Remarks

  Since 2.17.0

  + Defined in [packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts:233](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts#L233)
* asyncDefaultReportMessage<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets-1)>(
      out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets-1)> & { failed: true },
  ): Promise<string>

  Format output of [check](https://fast-check.dev/api-reference/functions/check.html) using the default error reporting of [assert](https://fast-check.dev/api-reference/functions/assert.html)

  Produce a string containing the formated error in case of failed run,
  undefined otherwise.

  #### Type Parameters

  + Ts

  #### Parameters

  + out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets-1)> & { failed: true }

  #### Returns Promise<string>

  #### Remarks

  Since 2.17.0

  + Defined in [packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts:243](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts#L243)
* asyncDefaultReportMessage<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets-2)>(out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets-2)>): Promise<string | undefined>

  Format output of [check](https://fast-check.dev/api-reference/functions/check.html) using the default error reporting of [assert](https://fast-check.dev/api-reference/functions/assert.html)

  Produce a string containing the formated error in case of failed run,
  undefined otherwise.

  #### Type Parameters

  + Ts

  #### Parameters

  + out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncDefaultReportMessage.html#asyncdefaultreportmessagets-2)>

  #### Returns Promise<string | undefined>

  #### Remarks

  Since 2.17.0

  + Defined in [packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts:253](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts#L253)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
