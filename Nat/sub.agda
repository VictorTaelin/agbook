module Nat.sub where

open import Nat.Main
open import Maybe.Main

-- Subtracts one natural number from another
-- - m: the number to subtract from
-- - n: the number to subtract
-- = Just the difference if m ≥ n, Nothing otherwise
sub : Nat → Nat → Maybe Nat
sub zero     zero     = some zero
sub zero     (succ _) = none
sub (succ m) zero     = some (succ m)
sub (succ m) (succ n) = sub m n
