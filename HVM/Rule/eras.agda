module HVM.Rule.eras where

open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Run.link
open import HVM.Term.Term

-- Erasure interaction
eras : ∀ {mode : Mode} → Term mode → Term mode → Run mode Unit
eras a1 a2 = do
  link Era a1
  link Era a2
