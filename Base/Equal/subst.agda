module Base.Equal.subst where

open import Base.Equal.Equal

-- Substitution property of equality.
-- 1st: The predicate.
-- 2nd: The value.
-- 3rd: The value.
-- 4th: Proof that 2nd is equal to 3rd.
-- 5th: Proof that 1st holds for 2ndx.
-- = Proof that 1st holds for 3rd.
subst : ∀ {a b} {A : Set a} {x y : A} → (P : A → Set b) → x ≡ y → P x → P y
subst P refl p = p

