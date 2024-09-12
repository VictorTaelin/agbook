module Imp.Test.show where

open import Data.Nat.Type
open import Data.U64.Type
open import Imp.Expr.Type
open import Imp.Stmt.Type
open import Imp.Notation
open import Imp.Stmt.show as Stmt

private
  from-nat : Nat → Expr
  from-nat n = (Num (primWord64FromNat n))

example : Stmt
example = do
  "i" := from-nat 0
  "a" := from-nat 1
  "b" := from-nat 2

  while (↑ "a") < (from-nat 10) go do
    while (↑ "b") < (from-nat 10) go do
      "i" := (↑ "a") * (↑ "b")

      "a" += (from-nat 1)
      Ignore (SAdd 0 (from-nat 1))

    if (↑ "a") % (↑ "b") == (from-nat 2) then do
      return (↑ "i")

expected-string = "i = 0
a = 1
b = 2
while (a < 10) {
  while (b < 10) {
    i = a * b
    a = a + 1
    atomic_add(shared[0], 1)
  }
  if (a % b == 2) {
    return i
  }
}"

open import Data.Equal.Type renaming (_==_ to _===_)

test-example : (Stmt.show example) === expected-string
test-example = refl
