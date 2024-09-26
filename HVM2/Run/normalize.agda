module HVM2.Run.normalize where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Maybe.Maybe
open import Base.Unit.Unit
open import HVM2.Redex.Redex
open import HVM2.Run.Run
open import HVM2.Run.Monad.bind
open import HVM2.Run.interact
open import HVM2.Run.redex-pop
open import HVM2.Run.Monad.pure

-- Normalizes the HVM2 state
normalize : Run Unit
normalize = do
  worked <- interact
  if worked
    then normalize
    else (pure unit)
