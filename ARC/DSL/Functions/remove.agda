module ARC.DSL.Functions.remove where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Container.Functions
open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.OrdSet.OrdSet
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Functions.equality
open import ARC.DSL.Functions.tolist

open import ARC.DSL.Types.Boolean.Functions
import ARC.DSL.Types.List.Functions as L
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Trait.Eq
open import Base.Trait.Ord

-- Removes a value from a container.
-- - A: The type of elements in the container.
-- - value: The value to be removed.
-- - container: The input container.
-- = A new container with the specified value removed.
remove : ∀ {A : Set} {{_ : Eq A}} {{_ : Ord A}} → A → Container A → Container A
remove value (AsList xs) = AsList (L.filter (λ x → not (equality x value)) xs)
remove value (AsOSet xs)  = AsOSet  (S.filter (λ x → not (equality x value)) xs)
