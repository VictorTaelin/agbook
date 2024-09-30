module ARC.DSL.Functions.product where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.Pair.Pair
open import ARC.DSL.Functions.container-to-list
open import Base.List.cartesian-product

-- Computes the cartesian product of two Containers.
-- - a: The first Container.
-- - b: The second Container.
-- = A new Container (as a ListC) containing all possible pairs of elements from a and b.
product : ∀ {A B : Set} → Container A → Container B → Container (Pair A B)
product a b = ListC (cartesian-product (container-to-list a) (container-to-list b))
