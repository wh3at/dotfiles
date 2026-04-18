---
title: "defaultReportMessage | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/defaultReportMessage"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [defaultReportMessage](https://fast-check.dev/api-reference/functions/defaultReportMessage.html)

# Function defaultReportMessage

* defaultReportMessage<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets)>(out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets)> & { failed: false }): undefined

  Format output of [check](https://fast-check.dev/api-reference/functions/check.html) using the default error reporting of [assert](https://fast-check.dev/api-reference/functions/assert.html)

  Produce a string containing the formated error in case of failed run,
  undefined otherwise.

  #### Type Parameters

  + Ts

  #### Parameters

  + out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets)> & { failed: false }

  #### Returns undefined

  #### Remarks

  Since 1.25.0

  + Defined in [packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts:199](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts#L199)
* defaultReportMessage<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets-1)>(out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets-1)> & { failed: true }): string

  Format output of [check](https://fast-check.dev/api-reference/functions/check.html) using the default error reporting of [assert](https://fast-check.dev/api-reference/functions/assert.html)

  Produce a string containing the formated error in case of failed run,
  undefined otherwise.

  #### Type Parameters

  + Ts

  #### Parameters

  + out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets-1)> & { failed: true }

  #### Returns string

  #### Remarks

  Since 1.25.0

  + Defined in [packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts:209](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts#L209)
* defaultReportMessage<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets-2)>(out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets-2)>): string | undefined

  Format output of [check](https://fast-check.dev/api-reference/functions/check.html) using the default error reporting of [assert](https://fast-check.dev/api-reference/functions/assert.html)

  Produce a string containing the formated error in case of failed run,
  undefined otherwise.

  #### Type Parameters

  + Ts

  #### Parameters

  + out: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/defaultReportMessage.html#defaultreportmessagets-2)>

  #### Returns string | undefined

  #### Remarks

  Since 1.25.0

  + Defined in [packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts:219](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/utils/RunDetailsFormatter.ts#L219)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
