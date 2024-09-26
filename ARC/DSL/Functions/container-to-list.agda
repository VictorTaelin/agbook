module ARC.DSL.Functions.container-to-list where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import Base.Trait.Ord

container-to-list : ∀ {A : Set} → Container A → List A
container-to-list (ListC l) = l
container-to-list (SetC  s) = S.to-list s
