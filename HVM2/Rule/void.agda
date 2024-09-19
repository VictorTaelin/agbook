module HVM2.Rule.void where

open import Base.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.Monad.pure

-- Void interaction
void : Run Unit
void = pure unit
