module Base.Pair.set-snd where

open import Base.Pair.Pair

-- Sets the second component of a pair to a new value.
-- 1st: The new value for the second component.
-- 2nd: The original pair.
-- = A new pair with the original first component and the updated second component.
set-snd : ∀ {a b} {A B : Set a} {C : Set b} → C → Pair A B → Pair A C
set-snd z (x , _) = x , z