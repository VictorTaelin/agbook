module ARC.DSL.Functions.contained where

open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Boolean.Functions
open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Trait.Ord
open import Base.Trait.Eq

-- TODO: generate EqA from OrdA so we don't require both

-- Checks if an element is contained in a Container.
-- - x: The element to check for.
-- - c: The Container to search in.
-- = True if x is in the Container, False otherwise.
contained : ∀ {A : Set} {{_ : Eq A}} {{_ : Ord A}} → A → Container A → Boolean
contained x (list l) = L.contains x l
contained x (set  s) = S.contains x s
