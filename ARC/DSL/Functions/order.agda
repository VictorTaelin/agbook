module ARC.DSL.Functions.order where

open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import Base.Trait.Ord

order : ∀ {A : Set} {{_ : Ord A}} → List A → List A
order = L.sort (λ x y → x < y)
