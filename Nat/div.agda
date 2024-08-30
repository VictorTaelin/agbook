module Nat.div where

open import Nat.Main
open import Nat.sub

div : Nat → Nat → Nat
 zero     _ = zero
mul (succ m) n = add n (mul m n)
