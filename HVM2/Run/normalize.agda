module HVM2.Run.normalize where

open import Data.Bool.Type
open import Data.Bool.if
open import Data.Maybe.Type
open import Data.Unit.Type
open import HVM2.Redex.Type
open import HVM2.Run.Type
open import HVM2.Run.bind
open import HVM2.Run.interact
open import HVM2.Run.redex-pop
open import HVM2.Run.pure

-- Normalizes the HVM2 state
normalize : Run Unit
normalize = do
  worked ← interact
  if worked
    then normalize
    else (pure unit)
