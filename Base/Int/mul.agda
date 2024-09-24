module Base.Int.mul where

open import Base.Int.Type
open import Base.Nat.Type
open import Base.Nat.mul using () renaming (_*_ to _n*_)
open import Base.Nat.add

-- Multiplication of integers.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = The product of x and y.
mul : Int -> Int -> Int
mul (Pos m)        (Pos n)        = Pos (m n* n)
mul (NegSuc m)     (NegSuc n)     = Pos ((Succ m) n* (Succ n))
mul (Pos Zero)     _              = Pos Zero
mul _              (Pos Zero)     = Pos Zero
mul (Pos (Succ m)) (NegSuc n)     = NegSuc ((m + n) + (m n* n))
mul (NegSuc m)     (Pos (Succ n)) = NegSuc ((m + n) + (m n* n))

_*_ : Int -> Int -> Int
_*_ = mul
