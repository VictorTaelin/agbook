module Base.IO.Trait.Monad where

open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.IO
open import Base.Trait.Monad

instance
  io-monad : Monad IO
  io-monad = record
    { bind = Base.IO.Monad.bind.bind
    ; pure = Base.IO.Monad.pure.pure
    }
