---
title: "Others | fast-check"
source_url: "https://fast-check.dev/docs/core-blocks/arbitraries/others/index"
fetched_at: "2025-12-29T00:47:28.315028+00:00"
---



* * [Core Blocks](https://fast-check.dev/docs/core-blocks/index.html)* [Arbitraries](https://fast-check.dev/docs/core-blocks/arbitraries/index.html)* Others

On this page

Several other arbitraries.

## falsy[​](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#falsy "Direct link to falsy")

Falsy values.

Generate falsy values ie. one of: `false`, `null`, `undefined`, `0`, `''`, `Number.NaN` or `0n`.

**Signatures:**

* `fc.falsy()`

**Usages:**

```
fc.falsy();
// Examples of generated values: null, 0, false, undefined, ""…

fc.falsy({ withBigInt: true });
// Examples of generated values: null, Number.NaN, false, undefined, 0n…
```

Resources: [API reference](https://fast-check.dev/api-reference/functions/falsy.html).
Available since 1.26.0.

## context[​](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#context "Direct link to context")

Generate an [instance of `ContextValue`](https://fast-check.dev/api-reference/interfaces/ContextValue.html) for each predicate run.

`ContextValue` can be used to log stuff within the run itself. In case of failure, the logs will be attached in the counterexample and visible in the stack trace.

**Signatures:**

* `fc.context()`

**Usages:**

```
fc.context();
// The produced value - let's call it ctx - can be used as a logger that will be specific to this run (and only this run).
// It can be called as follow: ctx.log('My log')
```

Resources: [API reference](https://fast-check.dev/api-reference/functions/context.html).
Available since 1.8.0.

## commands[​](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#commands "Direct link to commands")

Iterables of commands.

Model based testing approach extends the power of property based testing to state machines.
It relies on commands or operations that a user can run on the system. Those commands define:

* pre-condition — confirm whether or not the command can be executed given the current context
* execution — update a simplified context or *model* while updating and checking the *real* system

**Signatures:**

* `fc.commands(commandArbs)`
* `fc.commands(commandArbs, {disableReplayLog?, maxCommands?, size?, replayPath?})`

**with:**

* `commandArbs` — *array of arbitraries responsible to generate commands*
* `disableReplayLog?` — default: `false` — *disable the display of details regarding the replay for commands*
* `maxCommands?` — default: `0x7fffffff` [more](https://fast-check.dev/docs/configuration/larger-entries-by-default/#size-explained) — *maximal number of commands to generate (included)*
* `size?` — default: `undefined` [more](https://fast-check.dev/docs/configuration/larger-entries-by-default/#size-explained) — *how large should the generated values be?*
* `replayPath?` — *only used when replaying commands*

**Usages:**

```
type Model = { /* stuff */ };
type Real  = { /* stuff */ };

class CommandA extends Command { /* stuff */ };
class CommandB extends Command { /* stuff */ };
// other commands

const CommandsArbitrary = fc.commands([
  fc.constant(new CommandA()),        // no custom parameters
  fc.nat().map(s => new CommandB(s)), // with custom parameter
  // other commands
]);

fc.assert(
  fc.property(
    CommandsArbitrary,
    cmds => {
      const s = () => ({ // initial state builder
          model: /* new model */,
          real:  /* new system instance */
      });
      fc.modelRun(s, cmds);
    }
  )
);
```

Resources: [API reference](https://fast-check.dev/api-reference/functions/commands.html).
Available since .

## gen[​](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#gen "Direct link to gen")

This arbitrary has been designed to simplify the usage of Property Based Testing.
It helps to easily leverage Property Based Testing capabilities into tests based on fake-data.

No replay capabilities

When replaying failures on properties including a `fc.gen()`, you need to drop the path part. More precisely, you may keep the very first part but have to drop anything after the first ":".

Must be called in a deterministic order

Calls to the produced instance must be done in a determistic order.

**Signatures:**

* `fc.gen()`

**Usages:**

```
fc.gen();
// The produced value is a function able to generate random values from arbitraries within the tests themselves.
//
// It takes from 1 to N parameters:
// - the first parameter is a function able to return an arbitrary — ⚠️ this function must be a static function and not be recreated from one run to another
// - and its parameters as second, third...
//
// It can be called as follow:
// - g(fc.nat) — building a random value during the predicate using the arbitrary fc.nat()
// - g(fc.nat, {max: 10}) — same but using fc.nat({max: 10})
//
// ⚠️ But DO NOT USE: g(() => fc.nat({max: 10})).
// In the case right above, neither the builder of arbitrary nor the arbitrary itself are stable references. It would make shrinking impossible.
// If you do need to create a dedicated builder, define it outside of `fc.assert` and use it in your predicate as `g(myBuilder, ...parametersForMyBuilder)`.
```

Resources: [API reference](https://fast-check.dev/api-reference/functions/gen.html).
Available since 3.8.0.

## scheduler[​](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#scheduler "Direct link to scheduler")

Scheduler for asynchronous tasks.

**Signatures:**

* `fc.scheduler()`
* `fc.scheduler({ act? })`

**with:**

* `act` — *ensure that all scheduled tasks will be executed in the right context*

Resources: [API reference](https://fast-check.dev/api-reference/functions/scheduler.html).
Available since 1.20.0.

[Previous

Internet](https://fast-check.dev/docs/core-blocks/arbitraries/fake-data/internet/index.html)[Next

Properties](https://fast-check.dev/docs/core-blocks/properties/index.html)

* [falsy](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#falsy)* [context](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#context)* [commands](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#commands)* [gen](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#gen)* [scheduler](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html#scheduler)
