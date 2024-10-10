module ARC.DSL.Functions.int-cmp where

open import ARC.DSL.Types.Integer.Integer
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.Boolean.Boolean

int-cmp : ∀ {A : Set} → (A → Integer) → A → A → Boolean
int-cmp f x y = (f x) I.< (f y)

