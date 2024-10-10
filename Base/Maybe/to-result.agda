module Base.Maybe.to-result where

open import Base.Maybe.Maybe
open import Base.Result.Result

to-result : ∀ {A B : Set} → Maybe A → B → Result A B
to-result (Some x) y = Done x
to-result  None    y = Fail y

