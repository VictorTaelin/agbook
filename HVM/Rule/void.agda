module HVM.Rule.void where

open import Base.Unit.Unit
open import HVM.Run.Monad.pure
open import HVM.Run.Run

-- Void interaction
void : Run Unit
void = pure unit
