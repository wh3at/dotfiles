---
title: "CommandsContraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/CommandsContraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [CommandsContraints](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html)

# Interface CommandsContraints

Parameters for [commands](https://fast-check.dev/api-reference/functions/commands.html)

#### Remarks

Since 2.2.0

interface CommandsContraints {
    [disableReplayLog](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#disablereplaylog)?: boolean;
    [maxCommands](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#maxcommands)?: number;
    [replayPath](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#replaypath)?: string;
    [size](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/check/model/commands/CommandsContraints.ts:8](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/commands/CommandsContraints.ts#L8)

##### Index

### Properties

[disableReplayLog?](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#disablereplaylog)
[maxCommands?](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#maxcommands)
[replayPath?](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#replaypath)
[size?](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#size)

## Properties

### `Optional`disableReplayLog

disableReplayLog?: boolean

Do not show replayPath in the output

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.11.0

* Defined in [packages/fast-check/src/check/model/commands/CommandsContraints.ts:28](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/commands/CommandsContraints.ts#L28)

### `Optional`maxCommands

maxCommands?: number

Maximal number of commands to generate per run

You probably want to use `size` instead.

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 1.11.0

* Defined in [packages/fast-check/src/check/model/commands/CommandsContraints.ts:17](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/commands/CommandsContraints.ts#L17)

### `Optional`replayPath

replayPath?: string

Hint for replay purposes only

Should be used in conjonction with `{ seed, path }` of [assert](https://fast-check.dev/api-reference/functions/assert.html)

#### Remarks

Since 1.11.0

* Defined in [packages/fast-check/src/check/model/commands/CommandsContraints.ts:36](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/commands/CommandsContraints.ts#L36)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values (number of commands) should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/check/model/commands/CommandsContraints.ts:22](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/commands/CommandsContraints.ts#L22)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[disableReplayLog](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#disablereplaylog)[maxCommands](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#maxcommands)[replayPath](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#replaypath)[size](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
