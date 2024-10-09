module Base.Pair.set-fst where

open import Base.Pair.Pair

-- Sets the first component of a pair to a new value.
-- 1st: The new value for the first component.
-- 2nd: The original pair.
-- = A new pair with the updated first component and the original second component.
set-fst : ∀ {a b} {A B : Set a} {C : Set b} → C → Pair A B → Pair C B
set-fst z (x , y) = z , y

