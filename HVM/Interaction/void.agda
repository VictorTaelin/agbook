module HVM.Interaction.void where

open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.Term.Type

void : Term → Term → Runtime Unit
void a b = {!!}
