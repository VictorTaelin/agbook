module Data.Nat.div where

open import Data.Nat.Main
open import Data.Nat.sub
open import Data.Nat.lt
open import Data.Bool.if

-- Integer division of nats.
-- - m: The dividend.
-- - n: The divisor (must be non-zero).
-- = The quotient of m divided by n.
div : Nat → Nat → Nat
div m zero = zero  -- Division by zero returns zero.
div m n    = if (m < n) then zero else (succ (div (m - n) n))
