module ARC.DSL.Functions.argmin where

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

argmin : ∀ {A : Set} → A → Container A → (A → Integer) → A
argmin default (ListC xs) f with L.sort (int-cmp f) xs
... | []     = default
... | x :: _ = x
argmin default (SetC xs)  f with L.sort (int-cmp f) (S.to-list xs)
... | []     = default
... | x :: _ = x
