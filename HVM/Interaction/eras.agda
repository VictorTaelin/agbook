module HVM.Interaction.eras where

open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.link
open import HVM.Term.Type

eras : Term → Term → Runtime Unit
eras a1 a2 = do
  link Era a1
  link Era a2
