module Base.List.compare where

open import Base.List.Type
open import Base.Ordering.Type
import Base.Trait.Ord as Ord

-- Compares two lists lexicographically.
-- - cmp: The comparison function for list elements.
-- - xs: The first list.
-- - ys: The second list.
-- = LT if xs < ys, EQ if xs = ys, GT if xs > ys.
compare : ∀ {A : Set} -> (A -> A -> Ordering) -> List A -> List A -> Ordering
compare cmp []        []        = EQ
compare cmp []        (_ :: _)  = LT
compare cmp (_ :: _)  []        = GT
compare cmp (x :: xs) (y :: ys) with cmp x y
... | LT = LT
... | GT = GT
... | EQ = compare cmp xs ys
