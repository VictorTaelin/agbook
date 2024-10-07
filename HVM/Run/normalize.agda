module HVM.Run.normalize where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Unit.Unit
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Run.interact

-- Normalizes the HVM state
normalize : Run Unit
normalize = do
  changed ← interact
  if changed
    then normalize
    else pure unit
