module HVM2.Run.normalize where

open import Base.Bool.Type
open import Base.Bool.if
open import Base.Maybe.Type
open import Base.Unit.Type
open import HVM2.Redex.Type
open import HVM2.Run.Type
open import HVM2.Run.Monad.bind
open import HVM2.Run.interact
open import HVM2.Run.redex-pop
open import HVM2.Run.Monad.pure

-- Normalizes the HVM2 state
normalize : Run Unit
normalize = do
  worked ← interact
  if worked
    then normalize
    else (pure unit)
