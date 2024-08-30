module Nat.div where

open import Nat.Main
open import Nat.minus
open import Nat.less
open import Bool.if_then_else

-- Integer division of natural numbers
-- - m: the dividend
-- - n: the divisor (must be non-zero)
-- = the quotient of m divided by n
div : Nat → Nat → Nat
div m zero     = zero  -- Division by zero returns zero
div m n        = if (m < n) then zero else succ (div (m - n) n)
