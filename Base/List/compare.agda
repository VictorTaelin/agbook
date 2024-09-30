module Base.List.compare where

open import Base.List.List
open import Base.Ordering.Ordering
import Base.Trait.Ord as Ord

-- Compares two lists lexicographically.
-- - cmp: The comparison function for list elements.
-- - xs: The first list.
-- - ys: The second list.
-- = LT if xs < ys, EQ if xs = ys, GT if xs > ys.
compare : ∀ {A : Set} {{_ : Ord.Ord A}} → List A → List A → Ordering
compare []        []        = EQ
compare []        (_ :: _)  = LT
compare (_ :: _)  []        = GT
compare (x :: xs) (y :: ys) with Ord.compare x y
... | LT = LT
... | GT = GT
... | EQ = compare xs ys
