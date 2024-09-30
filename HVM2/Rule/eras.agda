module HVM2.Rule.eras where

open import Base.Unit.Unit
open import HVM2.Run.Run
open import HVM2.Run.Monad.bind
open import HVM2.Run.link
open import HVM2.Term.Term

eras : Term → Term → Run Unit
eras a1 a2 = do
  link Era a1
  link Era a2
