module HVM2.Rule.void where

open import Data.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.pure

-- Void interaction
void : Run Unit
void = pure unit
