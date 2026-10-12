---
title: "String | fast-check"
source_url: "https://fast-check.dev/docs/core-blocks/arbitraries/primitives/string/index"
fetched_at: "2025-12-29T00:47:28.315028+00:00"
---



* * [Core Blocks](https://fast-check.dev/docs/core-blocks/index.html)* [Arbitraries](https://fast-check.dev/docs/core-blocks/arbitraries/index.html)* [Primitives](https://fast-check.dev/docs/core-blocks/arbitraries/primitives/index.html)* String

On this page

Generate string values.

tip

If you want to join several strings together: refer to our [combiners section](https://fast-check.dev/docs/core-blocks/arbitraries/combiners/index.html). We have some [built-in combiners working exclusively on string values](https://fast-check.dev/docs/core-blocks/arbitraries/combiners/string/index.html).

## string[​](https://fast-check.dev/docs/core-blocks/arbitraries/primitives/string/index.html#string-1 "Direct link to string")

String containing characters produced by the character generator defined for `unit`. By default, `unit` defaults to `'grapheme-ascii'`. Our `unit`s have been built from documents linked to the specifications of Unicode 15.

**Signatures:**

* `fc.string()`
* `fc.string({minLength?, maxLength?, size?, unit?})`

**with:**

* `unit?` — default: `'grapheme-ascii'` — *how to generate the characters that will be joined together to create the resulting string*
* `minLength?` — default: `0` — *minimal number of units (included)*
* `maxLength?` — default: `0x7fffffff` [more](https://fast-check.dev/docs/configuration/larger-entries-by-default/#size-explained) — *maximal number of units (included)*
* `size?` — default: `undefined` [more](https://fast-check.dev/docs/configuration/larger-entries-by-default/#size-explained) — *how large should the generated values be?*

**Usages:**

```
fc.string();
// Examples of generated values: "JT>\"C9k", "h]iD\"27;", "S", "n\\Ye", ""…

fc.string({ maxLength: 3 });
// Note: Any string containing up to 3 (included) characters
// Examples of generated values: "", "ref", "?D", "key", "}"…

fc.string({ minLength: 3 });
// Note: Any string containing at least 3 (included) characters
// Examples of generated values: "Pv-^X_t", "bind", "?DM", "iEjK.b?^O", "}~}S"…

fc.string({ minLength: 4, maxLength: 6 });
// Note: Any string containing between 4 (included) and 6 (included) characters
// Examples of generated values: "Trxlyb", "&&@%4", "s@IO", "0\"zM", "}#\"$"…

fc.string({ unit: 'grapheme' });
// Note: Any string made only of printable graphemes possibly made of multiple code points.
// With 'grapheme', minLength (resp. maxLength) refers to length in terms of graphemes (visual entities).
// As an example, "\u{0061}\u{0300}" has a length of 1 in this context, as it corresponds to the visual entity: "à".
// Examples of generated values: "length", "🡓𑨭", "🚌ﾱॶ🥄ၜ㏹", "key", "callஈcall"…

fc.string({ unit: 'grapheme-composite' });
// Note: Any string made only of printable graphemes.
// With 'grapheme-composite', minLength (resp. maxLength) refers to length in terms of code points (equivalent to visual entities for this type).
// Examples of generated values: "🭃𖼰𱍊alleef", "#", "𝕃ᖺꏪ🪓ሪ㋯𑼓𘠴𑑖", "", "\"isP"…

fc.string({ unit: 'grapheme-ascii' });
// Note: Any string made only of printable ascii characters.
// With 'grapheme-composite', minLength (resp. maxLength) refers to length in terms of code units aka chars (equivalent to code points and visual entities for this type).
// Examples of generated values: "+", "y\\m4", ")H", "}q% b'", "ZvT`W"…

fc.string({ unit: 'binary' });
// Note: Results in strings made of any possible combinations of code points no matter how they join between each others (except half surrogate pairs).
// With 'binary', minLength (resp. maxLength) refers to length in terms of code points (not in terms of visual entities).
// As an example, "\u{0061}\u{0300}" has a length of 2 in this context, even if it corresponds to a single visual entity: "à".
// Examples of generated values: "length", "𒇖ᴣ󠓋򹕎󥰆󕃝󗅛񞙢򂓥񋂐", "", "󹶇񺓯𢊊񦺖", "key"…

fc.string({ unit: 'binary-ascii' });
// Note: Results in strings made of any possible combinations of ascii characters (in 0000-007F range).
// With 'binary-ascii', minLength (resp. maxLength) refers to length in terms of code units aka chars (equivalent to code points for this type).
// Examples of generated values: "c\\3\f\u0000\u001f\u00047", "M\u0006\fD!U\u000fXss", "", "s\u0000", "\n\u0006tkK"…

fc.string({ unit: fc.constantFrom('Hello', 'World') });
// Note: With a custom arbitrary passed as unit, minLength (resp. maxLength) refers to length in terms of unit values.
// As an example, "HelloWorldHello" has a length of 3 in this context.
// Examples of generated values: "", "Hello", "HelloWorld", "HelloWorldHello", "WorldWorldHelloWorldHelloWorld"…
```

Resources: [API reference](https://fast-check.dev/api-reference/functions/string.html).
Available since 0.0.1.

[Previous

Number](https://fast-check.dev/docs/core-blocks/arbitraries/primitives/number/index.html)[Next

Composites](https://fast-check.dev/docs/core-blocks/arbitraries/composites/index.html)

* [string](https://fast-check.dev/docs/core-blocks/arbitraries/primitives/string/index.html#string-1)
