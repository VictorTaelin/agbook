module ARC.DSL.Functions.combine where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Trait.Ord

-- Combines two Containers into a single Container.
-- - c1: The first Container.
-- - c2: The second Container.
-- = A new Container that contains all elements from both input Containers.
combine : ∀ {A : Set} {{_ : Ord A}} → Container A → Container A → Container A
combine (list l1) (list l2) = list (l1 L.++ l2)
combine (list l1) (set s2)  = list (l1 L.++ (S.to-list s2))
combine (set s1)  (list l2) = set  (s1 S.∪  (S.from-list l2))
combine (set s1)  (set s2)  = set  (s1 S.∪  s2)
