module Data.Int.exp where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Int.add
open import Data.Int.mul


-- Exponentiation of integers.
-- - m: The 1st int.
-- - n: The 2nd int.
-- = m to the power of n.
exp : Int → Int → Int
exp m (Pos Zero) = Pos (Succ Zero)
exp m (Pos (Succ n)) = m * exp m (Pos n)
-- TODO: Implement the case for negative exponents.but I need to implement division first.
