module ARC.DSL.Functions.apply where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.OrdSet.OrdSet
open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.Pair.Pair

open import Base.Trait.Ord

-- Applies a function to each element in a container.
-- - fn: The function to be applied to each element.
-- - c: The container of elements.
-- = A new container with the function applied to all elements.
apply : ∀ {A B} {{_ : Ord B}} → (A → B) → Container A → Container B
apply f (AsList xs) = AsList (L.map f xs)
apply f (AsOSet xs) = AsOSet (O.map f xs)
apply f (AsPair (x0 , x1)) = AsPair (f x0 , f x1)

