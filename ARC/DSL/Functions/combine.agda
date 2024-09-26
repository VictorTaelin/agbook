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
combine (ListC l1) (ListC l2) = ListC (l1 L.++ l2)
combine (ListC l1) (SetC s2)  = ListC (l1 L.++ (S.to-list s2))
combine (SetC s1)  (ListC l2) = SetC  (s1 S.∪  (S.from-list l2))
combine (SetC s1)  (SetC s2)  = SetC  (s1 S.∪  s2)
