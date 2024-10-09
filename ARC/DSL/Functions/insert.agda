module ARC.DSL.Functions.insert where

open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Trait.Ord

-- Inserts a value into a Container.
-- - value: The value to be inserted.
-- - container: The Container to insert into.
-- = A new Container with the value inserted.
insert : ∀ {A : Set} {{_ : Ord A}} → A → OrdSet A → OrdSet A
insert = S.insert

