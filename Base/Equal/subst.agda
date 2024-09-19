module Base.Equal.subst where

open import Base.Equal.Type

-- Substitution property of equality
-- If x is equal to y, then a predicate P holding for x also holds for y
-- - P: The predicate
-- - x: The first value
-- - y: The second value
-- - eq: Proof that x is equal to y
-- - px: Proof that P holds for x
-- = Proof that P holds for y
subst : ∀ {a b} {A : Set a} {x y : A} 
      → (P : A → Set b) 
      → x === y 
      → P x 
      → P y
subst P refl px = px
