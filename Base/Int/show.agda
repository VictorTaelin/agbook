module Base.Int.show where

import Base.Nat.show as Nat
open import Base.Int.Int
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.append

-- Converts an integer to its string representation.
-- - n: The integer to convert.
-- = A string representation of the integer.
show : Int → String
show (Pos n)    = Nat.show n
show (NegSuc n) = "-" ++ Nat.show (Succ n)

