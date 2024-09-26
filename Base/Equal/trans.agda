module Base.Equal.trans where

open import Base.Equal.Equal

-- Transitivity property of equality.
-- If x is equal to y and y is equal to z, then x is equal to z.
-- - x: The 1st value.
-- - y: The 2nd value.
-- - z: The 3rd value.
-- - p: Proof that x is equal to y.
-- - q: Proof that y is equal to z.
-- = Proof that x is equal to z.
trans : ∀ {a} {A : Set a} {x y z : A} -> x ≡ y -> y ≡ z -> x ≡ z
trans refl refl = refl
