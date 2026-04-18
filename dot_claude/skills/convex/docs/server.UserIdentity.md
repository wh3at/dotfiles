---
title: "Interface: UserIdentity | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.UserIdentity"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* UserIdentity

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).UserIdentity

Information about an authenticated user, derived from a
[JWT](https://datatracker.ietf.org/doc/html/rfc7519).

The only fields guaranteed to be present are
[tokenIdentifier](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#tokenidentifier) and [issuer](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#issuer). All
remaining fields may or may not be present depending on the information given
by the identity provider.

The explicitly listed fields are derived from the OpenID Connect (OIDC) standard fields,
see the [OIDC specification](https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims)
for more information on these fields.

Any additional fields are custom claims that may be present in the JWT,
and their type depends on your identity provider configuration. If you
know the type of the field, you can assert it in TypeScript like this
(for example as a `string`):

```
const identity = await ctx.auth.getUserIdentity();
if (identity === null) {
  return null;
}
const customClaim = identity.custom_claim as string;
```

## Indexable[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#indexable "Direct link to Indexable")

▪ [key: `string`]: [`JSONValue`](https://docs.convex.dev/api/modules/values.html#jsonvalue) | `undefined`

## Properties[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#properties "Direct link to Properties")

### tokenIdentifier[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#tokenidentifier "Direct link to tokenIdentifier")

• `Readonly` **tokenIdentifier**: `string`

A stable and globally unique string for this identity (i.e. no other
user, even from a different identity provider, will have the same string.)

JWT claims: `sub` + `iss`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in "Direct link to Defined in")

[server/authentication.ts:107](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L107)

---

### subject[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#subject "Direct link to subject")

• `Readonly` **subject**: `string`

Identifier for the end-user from the identity provider, not necessarily
unique across different providers.

JWT claim: `sub`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-1 "Direct link to Defined in")

[server/authentication.ts:115](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L115)

---

### issuer[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#issuer "Direct link to issuer")

• `Readonly` **issuer**: `string`

The hostname of the identity provider used to authenticate this user.

JWT claim: `iss`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-2 "Direct link to Defined in")

[server/authentication.ts:122](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L122)

---

### name[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#name "Direct link to name")

• `Optional` `Readonly` **name**: `string`

JWT claim: `name`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-3 "Direct link to Defined in")

[server/authentication.ts:127](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L127)

---

### givenName[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#givenname "Direct link to givenName")

• `Optional` `Readonly` **givenName**: `string`

JWT claim: `given_name`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-4 "Direct link to Defined in")

[server/authentication.ts:132](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L132)

---

### familyName[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#familyname "Direct link to familyName")

• `Optional` `Readonly` **familyName**: `string`

JWT claim: `family_name`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-5 "Direct link to Defined in")

[server/authentication.ts:137](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L137)

---

### nickname[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#nickname "Direct link to nickname")

• `Optional` `Readonly` **nickname**: `string`

JWT claim: `nickname`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-6 "Direct link to Defined in")

[server/authentication.ts:142](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L142)

---

### preferredUsername[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#preferredusername "Direct link to preferredUsername")

• `Optional` `Readonly` **preferredUsername**: `string`

JWT claim: `preferred_username`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-7 "Direct link to Defined in")

[server/authentication.ts:147](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L147)

---

### profileUrl[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#profileurl "Direct link to profileUrl")

• `Optional` `Readonly` **profileUrl**: `string`

JWT claim: `profile`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-8 "Direct link to Defined in")

[server/authentication.ts:152](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L152)

---

### pictureUrl[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#pictureurl "Direct link to pictureUrl")

• `Optional` `Readonly` **pictureUrl**: `string`

JWT claim: `picture`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-9 "Direct link to Defined in")

[server/authentication.ts:157](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L157)

---

### email[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#email "Direct link to email")

• `Optional` `Readonly` **email**: `string`

JWT claim: `email`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-10 "Direct link to Defined in")

[server/authentication.ts:162](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L162)

---

### emailVerified[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#emailverified "Direct link to emailVerified")

• `Optional` `Readonly` **emailVerified**: `boolean`

JWT claim: `email_verified`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-11 "Direct link to Defined in")

[server/authentication.ts:167](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L167)

---

### gender[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#gender "Direct link to gender")

• `Optional` `Readonly` **gender**: `string`

JWT claim: `gender`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-12 "Direct link to Defined in")

[server/authentication.ts:172](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L172)

---

### birthday[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#birthday "Direct link to birthday")

• `Optional` `Readonly` **birthday**: `string`

JWT claim: `birthdate`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-13 "Direct link to Defined in")

[server/authentication.ts:177](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L177)

---

### timezone[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#timezone "Direct link to timezone")

• `Optional` `Readonly` **timezone**: `string`

JWT claim: `zoneinfo`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-14 "Direct link to Defined in")

[server/authentication.ts:182](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L182)

---

### language[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#language "Direct link to language")

• `Optional` `Readonly` **language**: `string`

JWT claim: `locale`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-15 "Direct link to Defined in")

[server/authentication.ts:187](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L187)

---

### phoneNumber[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#phonenumber "Direct link to phoneNumber")

• `Optional` `Readonly` **phoneNumber**: `string`

JWT claim: `phone_number`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-16 "Direct link to Defined in")

[server/authentication.ts:192](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L192)

---

### phoneNumberVerified[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#phonenumberverified "Direct link to phoneNumberVerified")

• `Optional` `Readonly` **phoneNumberVerified**: `boolean`

JWT claim: `phone_number_verified`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-17 "Direct link to Defined in")

[server/authentication.ts:197](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L197)

---

### address[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#address "Direct link to address")

• `Optional` `Readonly` **address**: `string`

JWT claim: `address`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-18 "Direct link to Defined in")

[server/authentication.ts:202](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L202)

---

### updatedAt[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#updatedat "Direct link to updatedAt")

• `Optional` `Readonly` **updatedAt**: `string`

JWT claim: `updated_at`

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#defined-in-19 "Direct link to Defined in")

[server/authentication.ts:207](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L207)

[Previous

SystemDataModel](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html)[Next

ValidatedFunction](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html)

* [Indexable](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#indexable)
* [Properties](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#properties)
  + [tokenIdentifier](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#tokenidentifier)
  + [subject](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#subject)
  + [issuer](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#issuer)
  + [name](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#name)
  + [givenName](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#givenname)
  + [familyName](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#familyname)
  + [nickname](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#nickname)
  + [preferredUsername](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#preferredusername)
  + [profileUrl](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#profileurl)
  + [pictureUrl](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#pictureurl)
  + [email](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#email)
  + [emailVerified](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#emailverified)
  + [gender](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#gender)
  + [birthday](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#birthday)
  + [timezone](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#timezone)
  + [language](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#language)
  + [phoneNumber](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#phonenumber)
  + [phoneNumberVerified](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#phonenumberverified)
  + [address](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#address)
  + [updatedAt](https://docs.convex.dev/api/interfaces/server.UserIdentity.html#updatedat)
