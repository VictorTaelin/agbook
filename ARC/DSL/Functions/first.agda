module ARC.DSL.Functions.first where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Maybe.Maybe

-- Returns the first element of a Container, or a default value if empty.
-- - A: The type of elements in the Container.
-- - default: The value to return if the Container is empty.
-- - container: The Container to extract the first element from.
-- = The first element of the Container, or the default value if empty.
first : ∀ {A : Set} → A → Container A → A
first default (AsList [])       = default
first default (AsList (x :: _)) = x
first default (AsOSet s) with S.minimum s
... | Some x = x
... | None   = default
