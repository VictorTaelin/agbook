module Data.Int.exp where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Int.add
open import Data.Int.mul
open import Data.Int.div
open import Data.Float.Type
open import Data.Float.Operations


-- Exponentiation of integers.
-- - m: The 1st int.
-- - n: The 2nd int.
-- = m to the power of n.
exp : Int → Int → Int
exp m (Pos Zero)      = (Pos (Succ Zero))
exp m (Pos (Succ n))  = (m * (exp m (Pos n)))
exp m (Neg Zero)      = (Pos (Succ Zero)) / m -- TODO: use float division
exp m (Neg (Succ n))  = ((Pos (Succ Zero)) / (m * (exp m (Neg n)))) -- TODO: use float division


_^_ : Int → Int → Int
_^_ = exp
