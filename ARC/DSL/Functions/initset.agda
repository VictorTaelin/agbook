module ARC.DSL.Functions.initset where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import Base.Function.id

open import Base.Trait.Ord

-- Initializes a set with a single value.
-- - A: The type of the value to be contained.
-- - value: The initial value to be added to the set.
-- = An OrdSet with the single value.
initset : ∀ {A : Set} {{_ : Ord A}} → A → OrdSet A
initset value = S.singleton value

