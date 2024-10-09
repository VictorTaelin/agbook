module ARC.DSL.Functions.argmax where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Integer.Integer
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Boolean.Functions
open import ARC.DSL.Functions.int-cmp

open import Base.Maybe.Maybe

argmax : ∀ {A} → A → Container A → (A → Integer) → A
argmax default (AsList xs) f with L.last (L.sort (int-cmp f) xs)
... | None   = default
... | Some x = x
argmax default (AsOSet xs) f with L.last (L.sort (int-cmp f) (S.to-list xs))
... | None   = default
... | Some x = x
argmax default (AsPair (x0 , x1)) f with L.last (L.sort (int-cmp f) (x0 :: x1 :: []))
... | None   = default
... | Some x = x

