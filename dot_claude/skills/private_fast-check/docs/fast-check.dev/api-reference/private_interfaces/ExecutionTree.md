---
title: "ExecutionTree | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/ExecutionTree"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [ExecutionTree](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html)

# Interface ExecutionTree<Ts>

Summary of the execution process

#### Remarks

Since 1.9.0

interface ExecutionTree<[Ts](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#ts)> {
    [children](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#children): [ExecutionTree](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html)<[Ts](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#ts)>[];
    [status](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#status): [ExecutionStatus](https://fast-check.dev/api-reference/enums/ExecutionStatus.html);
    [value](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#value): [Ts](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#ts);
}

#### Type Parameters

* Ts

* Defined in [packages/fast-check/src/check/runner/reporter/ExecutionTree.ts:8](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/ExecutionTree.ts#L8)

##### Index

### Properties

[children](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#children)
[status](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#status)
[value](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#value)

## Properties

### children

children: [ExecutionTree](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html)<[Ts](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#ts)>[]

Values derived from this value

#### Remarks

Since 1.9.0

* Defined in [packages/fast-check/src/check/runner/reporter/ExecutionTree.ts:25](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/ExecutionTree.ts#L25)

### status

status: [ExecutionStatus](https://fast-check.dev/api-reference/enums/ExecutionStatus.html)

Status of the property

#### Remarks

Since 1.9.0

* Defined in [packages/fast-check/src/check/runner/reporter/ExecutionTree.ts:13](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/ExecutionTree.ts#L13)

### value

value: [Ts](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#ts)

Generated value

#### Remarks

Since 1.9.0

* Defined in [packages/fast-check/src/check/runner/reporter/ExecutionTree.ts:19](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/ExecutionTree.ts#L19)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[children](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#children)[status](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#status)[value](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html#value)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
