module HVM.Rule.void where

open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Run.Monad.pure
open import HVM.Run.Run

-- Void interaction
void : ∀ {mode : Mode} → Run mode Unit
void = pure unit
