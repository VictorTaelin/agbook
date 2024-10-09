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
combine : ∀ {A} {{_ : Ord A}} → Container A → Container A → Container A
combine (AsList l1) (AsList l2) = AsList (l1 L.++ l2)
combine (AsList l1) (AsOSet s2) = AsList (l1 L.++ (O.to-list s2))
combine (AsList l1) (AsPair p2) = AsList (l1 L.++ (P.to-list p2))
combine (AsOSet s1) (AsList l2) = AsOSet (s1 O.∪ (O.from-list l2))
combine (AsOSet s1) (AsOSet s2) = AsOSet (s1 O.∪ s2)
combine (AsOSet s1) (AsPair p2) = AsOSet (s1 O.∪ (O.from-list (P.to-list p2)))
combine (AsPair p1) (AsList l2) = AsList ((P.to-list p1) L.++ l2)
combine (AsPair p1) (AsOSet s2) = AsList ((P.to-list p1) L.++ (O.to-list s2))
combine (AsPair p1) (AsPair p2) = AsList ((P.to-list p1) L.++ (P.to-list p2))

