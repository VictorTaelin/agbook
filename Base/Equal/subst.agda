module Base.Equal.subst where

open import Base.Equal.Type

-- Substitution property of equality:
-- If x is equal to y, then a predicate P holding for x also holds for y.
-- - P: The predicate.
-- - x: The 1st value.
-- - y: The 2nd value.
-- - e: Proof that x is equal to y.
-- - p: Proof that P holds for x.
-- = Proof that P holds for y.
subst : ∀ {a b} {A : Set a} {x y : A} -> (P : A -> Set b) -> x ≡ y -> P x -> P y
subst P refl p = p
