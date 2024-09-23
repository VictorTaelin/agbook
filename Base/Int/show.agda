module Base.Int.show where

import Base.Nat.show as Nat
open import Base.Int.Type
open import Base.Nat.Type
open import Base.String.Type
open import Base.String.append

-- Converts an integer to its string representation.
-- - n: The integer to convert.
-- = A string representation of the integer.
show : Int → String
show (Pos n)    = Nat.show n
show (NegSuc n) = "-" ++ Nat.show (Succ n)
