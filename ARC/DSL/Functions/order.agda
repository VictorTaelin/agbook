module ARC.DSL.Functions.order where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import ARC.DSL.Types.Integer.Integer
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Functions.int-cmp

open import Base.Trait.Ord

order : ∀ {A : Set} → Container A → (A → Integer) → Container A
order (ListC xs) f = ListC (L.sort (int-cmp f) xs)
order (SetC  xs) f = ListC (L.sort (int-cmp f) (S.to-list xs))
