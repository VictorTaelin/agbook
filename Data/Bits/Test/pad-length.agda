module Data.Bits.Test.pad-length where

open import Data.Bits.Type
open import Data.Bits.pad-length
open import Data.Bits.length
open import Data.Bits.from-nat
open import Data.Nat.eq
open import Data.Trait.Eq
open import Data.Bool.if
open import Data.Bool.and
open import Data.Nat.Type
open import Data.Nat.gt
open import Data.Unit.Type
open import Data.Empty.Type
open import Data.Pair.Type
open import Data.Pair.fst
open import Data.Pair.snd

test-case : Nat → Nat → Set
test-case n1 n2 =
  let bits1 = from-nat n1
      bits2 = from-nat n2
      result = pad-length bits1 bits2
      expected-len = if (length bits1) == (length bits2)
                     then length bits1
                     else if (length bits1) > (length bits2)
                          then length bits1
                          else length bits2
  in if ((length (fst result)) == expected-len) &&
        ((length (snd result)) == expected-len) &&
        ((length (fst result)) == (length (snd result)))
     then Unit
     else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case 0 0
    _ = unit
    _ : test-case 1 1
    _ = unit
    _ : test-case 2 3
    _ = unit
    _ : test-case 7 4
    _ = unit
    _ : test-case 15 5
    _ = unit
    _ : test-case 42 8
    _ = unit
    _ : test-case 1042 12
    _ = unit

  in unit

main : Unit
main = run-tests
