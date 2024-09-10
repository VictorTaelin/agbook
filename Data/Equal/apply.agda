module Data.Equal.apply where

open import Data.Equal.Type

-- Congruence property of equality
-- If x is equal to y, then f applied to x is equal to f applied to y
-- - f: The function to apply
-- - x: The first value
-- - y: The second value
-- - p: Proof that x is equal to y
-- = Proof that f x is equal to f y
apply : ∀ {a b} {A : Set a} {B : Set b} (f : A → B) {x y : A} → x === y → f x === f y
apply f refl = refl
