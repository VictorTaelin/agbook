module HVM.Interaction.anni where

open import Debug.Trace

open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.link
open import HVM.Term.Type

-- Annihilation interaction
anni : Term → Term → Term → Term → Runtime Unit
anni a1 a2 b1 b2 = trace "ANNI" (do
  link a1 b1
  link a2 b2)
