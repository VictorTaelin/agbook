module Base.Int.eq where

open import Base.Int.Type
open import Base.Bool.Type
import Base.Nat.eq as Nat

-- Checks if two integers are equal.
-- - x: The first integer.
-- - y: The second integer.
-- = True if x is equal to y, False otherwise.
eq : Int -> Int -> Bool
eq (Pos m)    (Pos n)    = Nat.eq m n
eq (NegSuc m) (NegSuc n) = Nat.eq m n
eq _          _          = False

infix 4 _==_
_==_ : Int → Int → Bool
_==_ = eq
