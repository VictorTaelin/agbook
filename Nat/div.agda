module Nat.div where

open import Nat.Main
open import Nat.sub
open import Nat.lt
open import Bool.if

-- Integer division of nats.
-- - m: The dividend.
-- - n: The divisor (must be non-zero).
-- = The quotient of m divided by n.
div : Nat → Nat → Nat
div m zero = zero  -- Division by zero returns zero.
div m n    = if (m < n) then zero else (succ (div (m - n) n))
