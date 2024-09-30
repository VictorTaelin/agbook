module Base.List.cartesian-product where

open import Base.List.List
open import Base.List.cartesian-product-with
open import Base.Pair.Pair

-- Returns the cartesian product of two lists.
-- - xs: The first input list.
-- - ys: The second input list.
-- = A new list containing all possible pairs of elements from xs and ys.
cartesian-product : ∀ {A B : Set} → List A → List B → List (Pair A B)
cartesian-product = cartesian-product-with _,_
