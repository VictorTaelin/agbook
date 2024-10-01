module ARC.DSL.Functions.mostcommon where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Integer.Functions
open import ARC.DSL.Types.OrdSet.OrdSet
open import ARC.DSL.Types.Pair.Pair
open import ARC.DSL.Functions.container-to-list
open import ARC.DSL.Functions.dedupe

open import Base.Maybe.Maybe
open import Base.Trait.Ord
open import Base.AVLTree.invert
open import Base.AVLTree.maximum

-- Returns the most common item in a Container.
-- - container: The input Container.
-- = The most common item in the Container, or default if the Container is empty.
mostcommon : ∀ {A : Set} {{_ : Ord A}} → A → Container A → A
mostcommon default (AsList xs) with maximum (invert (L.frequency xs))
... | Some (freq , v) = v
... | None            = default
-- elements of a set can only appear once
mostcommon default (AsOSet  xs) = default
