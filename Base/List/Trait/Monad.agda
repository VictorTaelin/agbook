module Base.List.Trait.Monad where

open import Agda.Primitive
open import Base.List.Type
open import Base.Trait.Monad
import Base.List.Monad.bind as List
import Base.List.Monad.pure as List

instance
  MonadList : Monad List
  MonadList = record
    { bind = List.bind
    ; pure = List.pure
    }
