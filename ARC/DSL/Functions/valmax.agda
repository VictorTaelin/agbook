module ARC.DSL.Functions.valmax where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Integer.Integer
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Boolean.Functions

-- Finds the maximum value after applying a function to each element in a Container.
-- - A: The type of elements in the Container.
-- - container: The input Container (either a List or an OrdSet).
-- - f: A function that maps elements of type A to Integers.
-- = The maximum Integer value obtained after applying f to all elements,
--   or 0 if the Container is empty.
valmax : ∀ {A : Set} → Container A → (A → Integer) → Integer
valmax (AsList xs) f with L.sort I._>=_ (L.map f xs)
... | []     = 0  -- If the list is empty, return 0
... | x :: _ = x  -- Otherwise, return the first (maximum) element
valmax (AsOSet xs)  f with L.sort I._>=_ (L.map f (S.to-list xs))
... | []     = 0  -- If the set is empty, return 0
... | x :: _ = x  -- Otherwise, return the first (maximum) element

