module Base.Maybe.to-result where

open import Base.Maybe.Type
open import Base.Result.Type

to-result : ∀ {A B : Set} → Maybe A → B → Result A B
to-result (Some x) y = Done x
to-result  None    y = Fail y
