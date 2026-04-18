---
title: "WebAssembly for Functions"
source_url: "https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Shopify Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#shopify-wasm-api)
* [Supported first party languages](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#supported-first-party-languages)
* [Requirements](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#requirements)
* [Nan-box Value Structure (64-bit)](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#nan-box-value-structure-64-bit)
* [Reading Data](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#reading-data)
* [Writing Data](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#writing-data)
* [Migrating from the V1 Wasm API to the V2 Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#migrating-from-the-v1-wasm-api-to-the-v2-wasm-api)
* [Module example](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#module-example)

You can write your functions in any language that can compile to WebAssembly (Wasm), such as Rust, Zig, or TinyGo. This guide describes how to generate Wasm that conforms to Shopify Functions standards.

---

## [Anchor to Shopify Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#shopify-wasm-api)Shopify Wasm API

The Shopify Wasm API provides imported functions that your Wasm module uses to read input data and write output data. It defines a structured interface between your Shopify Function and the Shopify platform, including standardized value representations, status and error codes, and a compact Nan-boxed encoding format.

Using these API functions, your module can access data lazily at runtime instead of loading everything upfront. This approach eliminates the overhead of embedding a JSON parser into your compiled binary, resulting in smaller and more efficient Functions.

---

## [Anchor to Supported first party languages](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#supported-first-party-languages)Supported first party languages

The Shopify Wasm API supports the following first-party languages:

* **Rust:** Supported through the [`shopify_function`](https://shopify.dev/docs/apps/build/functions/programming-languages/rust-for-functions) crate, version 1.0.0 and above. Refer to the [migration guide](https://shopify.dev/docs/apps/build/functions/programming-languages/rust-for-functions#updating-existing-function-to-using-shopify_function-1-0-0-and-higher) to upgrade existing functions.
* **JavaScript:** Supported through the [`@shopify/shopify_function`](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions) npm package, version 2.0.0 and above, and the [latest version of Shopify CLI](https://shopify.dev/docs/api/shopify-cli#upgrade).

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#requirements)Requirements

Functions that are compiled to Wasm must meet the following requirements:

* Conform with the [Shopify Function Wasm API](https://github.com/Shopify/shopify-function-wasm-api/tree/main/api) specification.
* For each [target](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#targets) implemented by the extension, the module must export a function of type `(func)`, which takes no arguments, and has no return values.

  + Function modules are multi-call executables that have exports mapped to Shopify extension targets in the [function extension configuration](https://shopify.dev/docs/api/functions/configuration#properties).
* Write debug logs with the `shopify_function_log_new_utf8_str` imported Wasm function.

---

## [Anchor to Nan-box Value Structure (64-bit)](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#nan-box-value-structure-64-bit)Nan-box Value Structure (64-bit)

Input values in the Wasm API are represented as 64-bit NaN-boxed
values, represented as `i64` constants in WebAssembly. NaN-boxing
provides a performant way to represent multiple value types (such as
numbers, strings, booleans, objects, arrays, or errors) within
64-bits, without requiring additional memory allocations for type
information. The API uses specific bit patterns within the 64 bits
to encode value information.

### [Anchor to NaN-box Value Representation](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#nan-box-value-representation)NaN-box Value Representation

9

1

2

3

4

5

6

7

63 62 52 51 50 49 46 45 32 31 0

+---+------------+--+--+--------+-----------+--------------------+

| 0 | 11111111111| 1 | 1 | TTTT | LENGTH | VALUE |

+---+------------+--+--+--------+-----------+--------------------+

^ ^ ^ ^ ^ ^

Sign Exponent Quiet Tag bits Length Value bits

(0) (all 1s) NaN (type) (14 bits) (32 bits - data/ptr)

* **Sign bit**: 0
* **Exponent**: 11 bits, all 1's.
* **Quiet NaN**: 1 bit set to 1.
* **Tag bits (TTTT)**: 4 bits indicating value type (0-15). See [Value Types](#value-types) below for details.
* **Length field**: 14 bits for string/array length.
* **Value field**: 32 bits for actual data or a pointer to heap-allocated structures.

### [Anchor to 64-bit floating point values](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#64-bit-floating-point-values)64-bit floating point values

When a value is a floating-point number (type tag `2`), it is not
encoded through NaN-boxing. Instead, it directly uses the
standard IEEE 754 double-precision binary floating-point format:

9

1

2

3

4

5

6

7

63 62 52 51 0

+---+------------+--------------------------------------------+

| S | Exponent | Mantissa |

+---+------------+--------------------------------------------+

^ ^ ^

Sign Exponent Mantissa

(variable) (variable) (variable)

Floating point numbers in our API follow the [IEEE-754 specification](https://standards.ieee.org/ieee/754/6210/).

### [Anchor to Value Types](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#value-types)Value Types

The `Tag bits (TTTT)` in the NanBox structure determine the logical
type of the `i64` value. The following type tags are used:

* **0**: `Null` - Null value
* **1**: `Bool` - Boolean value (true/false)
* **2**: `Number` - Numeric value (f64)
* **3**: `String` - UTF-8 encoded string (pointer + length)
* **4**: `Object` - Key-value collection (pointer + length)
* **5**: `Array` - Indexed collection of values (pointer + length)
* **15**: `Error` - Read error codes

---

## [Anchor to Reading Data](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#reading-data)Reading Data

To read input data provided by the Shopify platform, your Wasm module
will use a set of imported API functions. These functions allow you to
access the root input value and traverse complex data structures like
objects and arrays. For a complete list and detailed signatures of
these read functions, refer to the [C header file](https://github.com/Shopify/shopify-function-wasm-api/tree/main/api/src/shopify_function.h) or the
[WebAssembly Text Format definition](https://github.com/Shopify/shopify-function-wasm-api/tree/main/api/src/shopify_function.wat).

Each read operation that retrieves data typically returns a NaN-boxed
value. This value should be interpreted according to the NanBox
structure and Value Types detailed above.

### [Anchor to Read Error Codes (i32 type)](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#read-error-codes-i32-type)Read Error Codes (i32 type)

When a 64-bit NaN-boxed value has its type tag bits set to `15`
(Error), it signifies that a read error occurred. The lower 32 bits of
this `i64` (the "Value field" in the NanBox structure) will then
contain one of the following `i32` error codes:

* **0**: `DecodeError` - Value could not be decoded
* **1**: `NotAnObject` - Expected an object but received another type
* **2**: `ByteArrayOutOfBounds` - Byte array index out of bounds
* **3**: `ReadError` - Error occurred during reading
* **4**: `NotAnArray` - Expected an array but received another type
* **5**: `IndexOutOfBounds` - Array index out of bounds
* **6**: `NotIndexable` - Value is not indexable (not an object or array)

  Shopify does not consider additions to this list to be a breaking change,
  so developers are encouraged to handle the case that new error
  values are emitted.

---

## [Anchor to Writing Data](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#writing-data)Writing Data

To write output data back to the Shopify platform, your Wasm module
will use a corresponding set of imported API functions. These
functions allow you to construct complex data structures, such as
objects and arrays, and populate them with various value types
(strings, numbers, booleans, null) as defined in the [Value
Types](#value-types) section. For a complete list and detailed
signatures of these write functions, refer to the [C header file](https://github.com/Shopify/shopify-function-wasm-api/tree/main/api/src/shopify_function.h) or the
[WebAssembly Text Format definition](https://github.com/Shopify/shopify-function-wasm-api/tree/main/api/src/shopify_function.wat).

Most write operations return an `i32` status code. A value of `0`
(Success) indicates the operation was successful, while other values
signify errors.

### [Anchor to Write Status Codes (i32 type)](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#write-status-codes-i32-type)Write Status Codes (i32 type)

These are the `i32` status codes returned by write operations:

* **0**: `Success` - The operation was successful
* **1**: `IoError` - Error occurred during writing
* **2**: `ExpectedKey` - Expected a key but received a value
* **3**: `ObjectLengthError` - Object length mismatch
* **4**: `ValueAlreadyWritten` - Value already written
* **5**: `NotAnObject` - Expected an object but received another type
* **6**: `ValueNotFinished` - Value creation not completed
* **7**: `ArrayLengthError` - Array length mismatch
* **8**: `NotAnArray` - Expected an array but received another type

  Shopify does not consider additions to this list to be a breaking change,
  so developers are encouraged to handle the case that new status
  codes are emitted.

---

## [Anchor to Migrating from the V1 Wasm API to the V2 Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#migrating-from-the-v1-wasm-api-to-the-v2-wasm-api)Migrating from the V1 Wasm API to the V2 Wasm API

1. Change any imports from the `shopify_function_v1` module to import from the `shopify_function_v2` module.
2. Stop passing the context pointer to any Wasm API functions as they no longer accept a context pointer as a parameter.
3. Remove any imports and calls to `shopify_function_context_new` and `shopify_function_output_finalize` as these functions have been removed from the API.
4. Call `shopify_function_log_new_utf8_str` to log a string instead of writing to standard error. Any writes to standard error will be ignored instead of logged.

---

## [Anchor to Module example](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#module-example)Module example

The following sample in [WebAssembly text format (WAT)](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format) shows the expected signature for module exports, and its associated extension configuration:

9

1

2

3

4

5

(module

(func $run (export "run")

...

)

)

9

1

2

3

4

[[extensions.targeting]]

target = "cart.lines.discounts.generate.run"

input\_query = "src/run.graphql"

export = "run" # This matches the name of the wasm export.

---

Was this page helpful?

YesNo

* [Shopify Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#shopify-wasm-api)
* [Supported first party languages](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#supported-first-party-languages)
* [Requirements](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#requirements)
* [Nan-box Value Structure (64-bit)](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#nan-box-value-structure-64-bit)
* [Reading Data](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#reading-data)
* [Writing Data](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#writing-data)
* [Migrating from the V1 Wasm API to the V2 Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#migrating-from-the-v1-wasm-api-to-the-v2-wasm-api)
* [Module example](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#module-example)
