module ARC.DSL.Functions.argmin where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Boolean.Functions
open import ARC.DSL.Functions.int-cmp

argmin : ∀ {A} → A → Container A → (A → Integer) → A
argmin default (AsList xs) f with L.sort (int-cmp f) xs
... | []     = default
... | x :: _ = x
argmin default (AsOSet xs) f with L.sort (int-cmp f) (O.to-list xs)
... | []     = default
... | x :: _ = x
argmin default (AsPair (x0 , x1)) f with L.sort (int-cmp f) (x0 :: x1 :: [])
... | []     = default
... | x :: _ = x
