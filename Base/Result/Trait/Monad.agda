module Base.Result.Trait.Monad where

open import Base.Result.Result
open import Base.Trait.Monad
import Base.Result.Monad.bind as Result

-- Implementation of the Monad instance for Result
instance
  result-monad : ∀ {E : Set} → Monad (λ A → Result A E)
  result-monad = record
    { bind = λ {A B} → Result.bind {A} {B}
    ; pure = λ {A} x → Done x
    }

