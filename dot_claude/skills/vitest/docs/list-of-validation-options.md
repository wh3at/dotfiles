---
title: "List of validation options"
source_url: "https://shopify.dev/docs/apps/build/custom-data/metafields/list-of-validation-options"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [How it works](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#how-it-works)
* [Supported validation options](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#supported-validation-options)
* [Examples](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#examples)
* [Next steps](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#next-steps)

Metafield definitions can have validation options. Validation options enable you to apply additional constraints to the data that a metafield can store, such as a minimum or maximum value, or a regular expression. The type of the metafield definition determines which validation options are available.

---

## [Anchor to How it works](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#how-it-works)How it works

You can include a validation option for a metafield definition using the validation `name` and a corresponding `value`. The appropriate value depends on the metafield type that the validation applies to. For more information about the supported formats and units of measurement available for each type, refer to [Metafield types](https://shopify.dev/docs/apps/build/metafields/list-of-data-types).

---

## [Anchor to Supported validation options](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#supported-validation-options)Supported validation options

The following table describes the validation options available for metafield definitions. Refer to the [examples](#examples) for validation option code snippets.

| Validation option | Description | Supported types | Use cases |
| --- | --- | --- | --- |
| [Minimum length](#minimum-length) | Sets the minimum length of a text value | * `single_line_text_field` * `multi_line_text_field` | * A blog summary needs to be at least 100 characters, so that it provides enough detail. * A value such as a zip code needs to have an exact character length, so set the minimum and maximum lengths to the same value. |
| [Maximum length](#maximum-length) | Sets the maximum length of a text value | * `single_line_text_field` * `multi_line_text_field` | * A blog summary or a product description needs to have a maximum length of 150 characters so that it fits in a designated area of your page. * A value such as a phone number needs to have an exact character length of ten, so set minimum length and maximum length to `10`. |
| [Regular expression](#regular-expression) | Sets a regular expression. Shopify supports [RE2](https://github.com/google/re2/wiki/Syntax). | * `single_line_text_field` * `multi_line_text_field` | * An email field requires an `@` symbol followed by a `.` and some text. * A serial number needs to start with a specific set of characters. |
| [Allowed domains](#allowed-domains) | A list of allowed domains. | `url` | * Allow links to specific social media sites at the bottom of an article. * Allow links to other pages within your site for a list of similar products. |
| [Choices](#choices) | A list of up to 128 predefined options that limit the values allowed for the metafield. The choices value has a maximum of 300,000 characters. | `single_line_text_field` | * The flavor profile field for coffee products allows the following choices: Floral, Sweet, Nutty, and Other. * The field for sizing fits for a product allows the following choices: True to size, Runs large, Runs small. |
| [File type options](#file-type-options) | Sets a list of file type options. Leaving this empty allows all files, regardless of type.  Valid values: `Image`, `Video`. | `file_reference` | * A file reference from a blog to an author photo needs to be to an image file type. * A file reference to a demonstration video in MP4 format. * A file reference from an order to product instructions in PDF format. |
| [Maximum precision](#maximum-precision) | Sets the maximum number of decimal places to store for a decimal number | `number_decimal` | * A version number field needs to accept a number with one decimal place. * A specification field for a product needs to have a maximum of three decimal places. |
| [Minimum date](#minimum-date) | Sets the minimum date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format | `date` | The date field for an expiry date or a product release needs to be after a specific date. |
| [Maximum date](#maximum-date) | Sets the maximum date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format | `date` | The date for future product availability can't be later than a specific date. |
| [Minimum datetime](#minimum-datetime) | Sets the minimum date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format | `date_time` | A product release occurs on a specific date at midnight, and the product won't display before that date and time. |
| [Maximum datetime](#maximum-datetime) | Sets the maximum date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format | `date_time` | A customer loyalty reward expires on a specific date and time. The reward can't be used after that date and time. |
| [Minimum weight](#minimum-weight) | Sets the minimum weight | `weight` | A bundled product weight field needs to have a maximum allowed weight. |
| [Maximum weight](#maximum-weight) | Sets the maximum weight | `weight` | An order requires a minimum weight for shipping. |
| [Minimum volume](#minimum-volume) | Sets the minimum volume | `volume` | * A product volume field needs to have a specific minimum volume. * A product needs to have an exact volume, so you set minimum volume and maximum volume to the same value. |
| [Maximum volume](#maximum-volume) | Sets the maximum volume | `volume` | * A product volume field needs to have certain maximum volume. * A product needs to have an exact volume, so you set minimum volume and maximum volume to the same value. |
| [Minimum dimension](#minimum-dimension) | Sets the minimum dimension | `dimension` | A product needs to have a minimum length, width, or height. |
| [Maximum dimension](#maximum-dimension) | Sets the maximum dimension | `dimension` | A product needs to have a maximum length, width, or height. |
| [Minimum integer](#minimum-integer) | Sets the minimum integer number | `number_integer` | A product number needs to be within a specific range of numbers, so you set the minimum and maximum integer validations to create the range. |
| [Maximum integer](#maximum-integer) | Sets the maximum integer number | `number_integer` | A product number needs to be within a specific range of numbers, so you set the minimum and maximum integer validations to create the range. |
| [Minimum decimal](#minimum-decimal) | Sets the minimum decimal number | `number_decimal` | A product version field needs to accept a version number that's greater than a specific decimal number, such as `0.5`. |
| [Maximum decimal](#maximum-decimal) | Sets the maximum decimal number | `number_decimal` | A product version field needs to accept a version number that's less than a specific decimal number, such as `1.99`. |
| [Metaobject definition](#metaobject-definition) | Sets the metaobject definition that a reference must point to | * `metaobject_reference` * `list.metaobject_reference` | A product refers to a `Designer` metaobject. |
| [Multiple metaobject definitions](#multiple-metaobject-definitions) | Sets the permitted metaobject definitions that can be referred to | * `mixed_reference` * `list.mixed_reference` | * A product that references a list of different `Material` metaobjects. * A dynamic placeholder reference that can support a union set of metaobject definitions. |
| [JSON schema](#json-schema) | Sets the permitted JSON format. The [JSON schema](https://json-schema.org/learn/miscellaneous-examples.html) provides an example of a standard way to structure your JSON, and contains information about valid data types and the key descriptions. The JSON schema has a maximum of 300,000 characters. | `json` | Data from a 3rd-party app must match a specific JSON schema. |
| [Product taxonomy attribute](#product-taxonomy-attribute) | Sets the product taxonomy attribute that a reference must point to | * `product_taxonomy_value_reference` * `list.product_taxonomy_value_reference` | * A product that references a `Color` taxonomy value. * A product that references a list of `Material` taxonomy values. |
| [List minimum](#list-minimum) | Sets the minimum number of items in a list | Any list type | * A product must have at least two related products. * A blog post must have at least one tag. |
| [List maximum](#list-maximum) | Sets the maximum number of items in a list | Any list type | * A product can have up to five related products. * A blog post can have up to 10 tags. |

---

## [Anchor to Examples](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#examples)Examples

This section provides examples of each validation option.

### [Anchor to Minimum length](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-length)Minimum length

The following example validates the minimum length of a text value to eight characters.

9

1

2

3

4

validations: [{

name: "min",

value: "8"

}]

### [Anchor to Maximum length](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-length)Maximum length

The following example validates the maximum length of a text value to 25 characters.

9

1

2

3

4

validations: [{

name: "max",

value: "25"

}]

### [Anchor to Regular expression](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#regular-expression)Regular expression

The following example validates a regular expression that matches the pattern `(@)(.+)$`.

9

1

2

3

4

validations: [{

name: "regex",

value: "(@)(.+)$"

}]

### [Anchor to Allowed domains](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#allowed-domains)Allowed domains

The following example validates `shopify.com` against a list of allowed domains.

9

1

2

3

4

validations: [{

name: "allowed\_domains",

value: "[\"shopify.com\"]"

}]

### [Anchor to Choices](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#choices)Choices

The following example validates the values allowed for the metafield: `red`, `green`, `blue`.

9

1

2

3

4

validations: [{

name: "choices",

value: "[\"red\", \"green\", \"blue\"]"

}]

### [Anchor to File type options](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#file-type-options)File type options

The following example validates the allowed file type options: `Image`, `Video`.

9

1

2

3

4

validations: [{

name: "file\_type\_options",

value: "[\"Image\",\"Video\"]"

}]

### [Anchor to Maximum precision](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-precision)Maximum precision

The following example validates that the maximum number of decimal places to store for a floating-point number is two.

9

1

2

3

4

validations: [{

name: "max\_precision",

value: "2"

}]

### [Anchor to Minimum date](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-date)Minimum date

The following example validates the setting for the minimum date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.

9

1

2

3

4

validations: [{

name: "min",

value: "2022-01-01"

}]

### [Anchor to Maximum date](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-date)Maximum date

The following example validates the setting for the maximum date in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.

9

1

2

3

4

validations: [{

name: "max",

value: "2022-03-03"

}]

### [Anchor to Minimum datetime](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-datetime)Minimum datetime

The following example validates the setting for the minimum date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.

9

1

2

3

4

validations: [{

name: "min",

value: "2022-03-03T16:30:00"

}]

### [Anchor to Maximum datetime](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-datetime)Maximum datetime

The following example validates the setting for the maximum date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.

9

1

2

3

4

validations: [{

name: "max",

value: "2022-03-03T16:30:00"

}]

### [Anchor to Minimum weight](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-weight)Minimum weight

The following example validates a setting for the minimum weight to be ten grams.

9

1

2

3

4

validations: [{

name: "min",

value: "{\"unit\":\"g\",\"value\":10}"

}]

### [Anchor to Maximum weight](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-weight)Maximum weight

The following example validates a setting for the maximum weight to be 50 grams.

9

1

2

3

4

validations: [{

name: "max",

value: "{\"unit\":\"g\",\"value\":50}"

}]

### [Anchor to Minimum volume](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-volume)Minimum volume

The following example validates a setting for the minimum volume to be five milliliters.

9

1

2

3

4

validations: [{

name: "min",

value: "{\"unit\":\"ml\",\"value\":5}"

}]

### [Anchor to Maximum volume](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-volume)Maximum volume

The following example validates a setting for the maximum volume to be 50 milliliters.

9

1

2

3

4

validations: [{

name: "max",

value: "{\"unit\":\"ml\",\"value\":50}"

}]

### [Anchor to Minimum dimension](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-dimension)Minimum dimension

The following example validates a setting for the minimum dimension to be five centimeters.

9

1

2

3

4

validations: [{

name: "min",

value: "{\"unit\":\"cm\",\"value\":5}"

}]

### [Anchor to Maximum dimension](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-dimension)Maximum dimension

The following example validates a setting for the maximum dimension to be 50 centimeters.

9

1

2

3

4

validations: [{

name: "max",

value: "{\"unit\":\"cm\",\"value\":50}"

}]

### [Anchor to Minimum integer](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-integer)Minimum integer

The following example validates a setting for the minimum integer number to be nine.

9

1

2

3

4

validations: [{

name: "min",

value: "9"

}]

### [Anchor to Maximum integer](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-integer)Maximum integer

The following example validates a setting for the maximum integer number to be 15.

9

1

2

3

4

validations: [{

name: "max",

value: "15"

}]

### [Anchor to Minimum decimal](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#minimum-decimal)Minimum decimal

The following example validates a setting for the minimum decimal number to be 0.5.

9

1

2

3

4

validations: [{

name: "min",

value: "0.5"

}]

### [Anchor to Maximum decimal](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#maximum-decimal)Maximum decimal

The following example validates a setting for the maximum decimal number to be 1.99.

9

1

2

3

4

validations: [{

name: "max",

value: "1.99"

}]

### [Anchor to Metaobject definition](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#metaobject-definition)Metaobject definition

The following example validates a setting for the metaobject definition that a reference must point to.

9

1

2

3

4

validations: [{

name: "metaobject\_definition\_id",

value: "gid://shopify/MetaobjectDefinition/123"

}]

### [Anchor to Multiple metaobject definitions](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#multiple-metaobject-definitions)Multiple metaobject definitions

The following example validates a setting for the permitted metaobject definitions that can be referred to.

9

1

2

3

4

validations: [{

name: "metaobject\_definition\_ids",

value: "[\"gid://shopify/MetaobjectDefinition/123\",\"gid://shopify/MetaobjectDefinition/456\"]"

}]

### [Anchor to JSON schema](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#json-schema)JSON schema

The following example validates a setting for the permitted JSON format.

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

validations: [{

name: "schema",

value: "{

\"\$id\": \"https://example.com/person.schema.json\",

\"\$schema\": \"https://json-schema.org/draft/2020-12/schema\",

\"title\": \"Person\",

\"type\": \"object\",

\"properties\": {

\"firstName\": {

\"type\": \"string\",

\"description\": \"The person's first name.\"

},

\"lastName\": {

\"type\": \"string\",

\"description\": \"The person's last name.\"

},

\"age\": {

\"description\": \"Age in years >= 0.\",

\"type\": \"integer\",

\"minimum\": 0

}

}

}"

}]

### [Anchor to Product taxonomy attribute](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#product-taxonomy-attribute)Product taxonomy attribute

The following example validates a setting for the product taxonomy attribute that a reference must point to.

9

1

2

3

4

validations: [{

name: "product\_taxonomy\_attribute\_handle",

value: "style"

}]

### [Anchor to List minimum](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#list-minimum)List minimum

The following example validates that a list must contain at least two items.

9

1

2

3

4

validations: [{

name: "list.min",

value: "2"

}]

### [Anchor to List maximum](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#list-maximum)List maximum

The following example validates that a list can contain up to five items.

9

1

2

3

4

validations: [{

name: "list.max",

value: "5"

}]

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#next-steps)Next steps

* Learn how to [work with metafield definitions](https://shopify.dev/docs/apps/build/metafields/definitions).
* Learn about [metafield data types](https://shopify.dev/docs/apps/build/metafields/list-of-data-types).
* Learn how to [enable filtering and other advanced features](https://shopify.dev/docs/apps/build/metafields/use-metafield-capabilities).

---

Was this page helpful?

YesNo

* [How it works](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#how-it-works)
* [Supported validation options](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#supported-validation-options)
* [Examples](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#examples)
* [Next steps](https://shopify.dev/docs/apps/build/metafields/list-of-validation-options#next-steps)
