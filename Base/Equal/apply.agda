module Base.Equal.apply where

open import Base.Equal.Equal

-- Congruence property of equality.
-- If two values are equal, then applying a function to both yields equal results.
-- 1st: The function to apply.
-- 2nd: The 1st value.
-- 3rd: The 2nd value.
-- 4th: Proof that x is equal to y.
-- = Proof that (1st 2nd) is equal to (1st 3rd).
apply : ∀ {a b} {A : Set a} {B : Set b} (f : A → B) {x y : A} → x ≡ y → f x ≡ f y
apply f refl = refl
