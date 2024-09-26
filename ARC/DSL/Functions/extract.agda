module ARC.DSL.Functions.extract where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Functions.container-to-list
open import Base.List.find
open import Base.Maybe.Maybe

-- Extracts an element from a Container that satisfies a given predicate.
-- If no element satisfies the predicate, returns a default value.
-- - A: The type of elements in the Container.
-- - default: The value to return if no element satisfies the predicate.
-- - cs: The Container to search.
-- - pred: The predicate function to test elements.
-- = The first element that satisfies the predicate, or the default value.
extract : ∀ {A : Set} → A → Container A → (A → Boolean) → A
extract default cs pred with find pred (container-to-list cs)
... | Some x = x  -- If an element satisfying the predicate is found, return it
... | None   = default  -- If no element is found, return the default value
