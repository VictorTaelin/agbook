module HVM.Runtime.normalize where

open import Data.Bool.Type
open import Data.Bool.if
open import Data.Maybe.Type
open import Data.Unit.Type
open import HVM.Interaction.interact
open import HVM.Redex.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.pop-redex
open import HVM.Runtime.pure

-- Normalizes the HVM state
normalize : Runtime Unit
normalize = do
  worked ← interact
  if worked
    then normalize
    else (pure unit)
