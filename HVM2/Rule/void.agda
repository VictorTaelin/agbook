module HVM2.Rule.void where

open import Base.Unit.Unit
open import HVM2.Run.Run
open import HVM2.Run.Monad.pure

-- Void interaction
void : Run Unit
void = pure unit
