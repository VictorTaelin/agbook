module Base.Int.compare where

open import Base.Ordering.Type
open import Base.Nat.Type
open import Base.Nat.compare renaming (compare to compare-nat)
open import Base.Int.Type

-- Compares two natural numbers.
-- - m: The first natural number.
-- - n: The second natural number.
-- = LT if m < n, EQ if m = n, GT if m > n.
compare : Int → Int → Ordering
compare (Pos m) (Pos n) = compare-nat m n
compare (NegSuc m) (NegSuc n) with compare-nat m n
... | LT = GT
... | EQ = EQ
... | GT = LT
compare (Pos _) (NegSuc _) = GT
compare (NegSuc _) (Pos _) = LT
