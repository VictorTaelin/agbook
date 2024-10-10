module Base.Maybe.Trait.Monad where

open import Base.Maybe.Maybe
open import Base.Trait.Monad
import Base.Maybe.Monad.bind as Maybe
import Base.Maybe.Monad.pure as Maybe

-- Implementation of the Monad instance for Maybe
instance
  maybe-monad : Monad Maybe
  maybe-monad = record
    { bind = Maybe.bind
    ; pure = Maybe.pure
    }

