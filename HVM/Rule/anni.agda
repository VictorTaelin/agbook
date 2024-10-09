module HVM.Rule.anni where

open import Base.Unit.Unit
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Run.link
open import HVM.Term.Term

-- Annihilation interaction
anni : Term → Term → Term → Term → Run Unit
anni a1 a2 b1 b2 = do
  link a1 b1
  link a2 b2

