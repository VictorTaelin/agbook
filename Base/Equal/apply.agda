module Base.Equal.apply where

open import Base.Equal.Type

-- Congruence property of equality:
-- If two values are equal, then applying a function to both yields equal results.
-- - f: The function to apply.
-- - x: The 1st value.
-- - y: The 2nd value.
-- - e: Proof that x is equal to y.
-- = Proof that f x is equal to f y.
apply : ∀ {a b} {A : Set a} {B : Set b} (f : A -> B) {x y : A} -> x ≡ y -> f x ≡ f y
apply f refl = refl
