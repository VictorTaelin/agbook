module Data.Maybe.to-result where

open import Data.Maybe.Type
open import Data.Result.Type

to-result : ∀ {A B : Set} → Maybe A → B → Result A B
to-result (Some x) y = Done x
to-result  None    y = Fail y
