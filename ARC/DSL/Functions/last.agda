module ARC.DSL.Functions.last where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Maybe.Maybe

-- Returns the last element of a Container, or a default value if empty.
-- - A: The type of elements in the Container.
-- - default: The value to return if the Container is empty.
-- - container: The Container to extract the last element from.
-- = The last element of the Container, or the default value if empty.
last : ∀ {A : Set} → A → Container A → A
last default (AsList l) with L.last l
... | Some x = x  -- If the list has a last element, return it
... | None   = default  -- If the list is empty, return the default value
last default (AsOSet s) with S.maximum s
... | Some x = x  -- For a set, the last element is the maximum value
... | None   = default  -- If the set is empty, return the default value

