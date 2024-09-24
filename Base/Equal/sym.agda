module Base.Equal.sym where

open import Base.Equal.Type

-- Symmetry property of equality.
-- If x is equal to y, then y is equal to x.
-- - x: The 1st value.
-- - y: The 2nd value.
-- - p: Proof that x is equal to y.
-- = Proof that y is equal to x.
sym : ∀ {a} {A : Set a} {x y : A} -> x === y -> y === x
sym refl = refl
