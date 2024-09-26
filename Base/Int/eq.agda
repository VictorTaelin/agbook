module Base.Int.eq where

import Base.Nat.eq as Nat
open import Base.Bool.Bool
open import Base.Int.Int
open import Base.Nat.Nat

-- Checks if two integers are equal.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x and y are equal, False otherwise.
eq : Int -> Int -> Bool
eq (Pos m)    (Pos n)    = Nat.eq m n
eq (NegSuc m) (NegSuc n) = Nat.eq m n
eq _          _          = False

infix 4 _==_
_==_ : Int -> Int -> Bool
_==_ = eq
