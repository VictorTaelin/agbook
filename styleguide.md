# Style Guide

## Variable Names

Camel Case (variableName) is the most used style in agda.
Kebab Case (variable-name) is also possible, from my POV it is used when you have related names (suppose you want to proof reflexivity for floats, it would be float-refl).
Snake Case not really possible because of mixfix notation.

## Type Definitions

In our repo, each file defines either a type or a function.
For type definitions that are under `Data/` , it was discussed that types should be named with the same pattern of builtins.
E.g, today we have:
```agda
data Nat : Set where
  Zero : Nat
  Succ : Nat → Nat
```
But the default agda builtin uses `zero` and `suc`. Then it is easy to use the Agda definitions we want.

## Tabs

Identation, define 2 or 4 spaces.

## Function style

Same discussion of variable names. For example, should we call `from-nat` or `fromNat` ?

For functions, its preferred to use `do` notation with `let` instead of `let...in` and `where`. Practical example:
```agda
pad-length : Bits → Bits → Pair Bits Bits
pad-length a b =
  let len-a = length a
      len-b = length b
      target-len = max len-a len-b
  in pad-zeros target-len a , pad-zeros target-len b
``` 
This was the old implementation of a `pad-length` function. The fixed implementation would be:
```agda
pad-length a b = do
  let len-a   = length a
  let len-b   = length b
  let trg-len = max len-a len-b
  pad-zeros trg-len a , pad-zeros trg-len b
```

Note that the identation of patterns is also aligned (both for lets and when using match as well, e.g:)
This is wrong:
```agda
pred : Bits → Bits
pred E = E
pred (O E) = E
pred (O bs) = I (pred bs)
pred (I bs) = O bs
```

This is right:
```agda
pred : Bits → Bits
pred E      = E
pred (O E)  = E
pred (O bs) = I (pred bs)
pred (I bs) = O bs
```

For names, we should focus on basic operations. If you are implementing Nat/add , call the function `add`, no need to `nat-add`. Although this causes name clashes when you use multiple add for types, you can rename using `open import Base.Nat.add renaming (_+_ to _n+_)` for example. It also makes it easy to implement TypeClasses later.

## Tests

A test directory should be in the same directory of the data it is testing. E.g, the test files for maps are in `Data/Map/Test/` .
Each data file should have a test equivalent (e.g if you define `Data/Map/hey.agda` another file `Data/Map/Test/hey.agda` should exist.

Preference for tests using Eq and `refl` as proofs.

---

When changing existing code or definitions, check ALL the files of the repository, since you could directly break other features that use the one you changed. This is happening a lot now (because we are defining a lot of new stuff and changing fast), but we should be used to run tests and typechecking all the time.
(this should also be added as a workflow on a CI/CD pipeline).

Always add documentation to the functions you write. The format:
```
-- Performs right shift operation on a Bits value.
-- - bits: The input Bits value.
-- - n: The number of positions to shift right (represented as Nat).
-- = A new Bits value representing the right-shifted result.
rshift : Bits → Nat → Bits
```
Is the one adopted so far. Quick and easy.
