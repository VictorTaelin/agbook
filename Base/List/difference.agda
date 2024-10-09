module Base.List.difference where

open import Base.List.List
open import Base.List.filter
open import Base.List.contains
open import Base.Bool.not
open import Base.Trait.Eq

-- Computes the difference between two lists.
-- - xs: The first list.
-- - ys: The second list.
-- = A new list containing elements from xs that are not in ys.
difference : ∀ {A : Set} {{EqA : Eq A}} → List A → List A → List A
difference xs ys = filter (λ x → not (contains x ys)) xs

