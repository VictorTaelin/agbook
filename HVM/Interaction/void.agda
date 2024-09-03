module HVM.Interaction.void where

open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.Runtime.pure

-- Void interaction
void : Runtime Unit
void = pure unit
