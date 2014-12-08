# deferrable_gratification changes

## v1.1.0
- Add `DG.all_successes` to asynchronously perform a set of operations, and
  either succeed when all operations succeed, or fail with the first failure.

## v1.0.0
- Remove the `Fluent` module as the same syntax is available in
  `EventMachine` 1.0.3.
- Add `failure_value` to `DeferrableGratification::Primitives` to fail without
  an exception. Any value may be specified, but the main use is to fail with
  only an error string.
