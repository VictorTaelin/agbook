module HVM2.Rule.anni where

open import Debug.Trace

open import Base.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.bind
open import HVM2.Run.link
open import HVM2.Term.Type

-- Annihilation interaction
anni : Term → Term → Term → Term → Run Unit
anni a1 a2 b1 b2 = trace "ANNI" (do
  link a1 b1
  link a2 b2)
