module ARC.DSL.Functions.other where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Functions.remove
open import ARC.DSL.Functions.first

open import Base.Trait.Eq
open import Base.Trait.Ord

-- Returns the other value in the container (first value that is not the given one).
-- - A: The type of elements in the container.
-- - container: The input container.
-- - value: The value to exclude.
-- = The first element in the container that is not equal to the given value.
other : ∀ {A : Set} {{_ : Eq A}} {{_ : Ord A}} → Container A → A → A
other container value = first value (remove value container)

