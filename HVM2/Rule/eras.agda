module HVM2.Rule.eras where

open import Base.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.bind
open import HVM2.Run.link
open import HVM2.Term.Type

eras : Term → Term → Run Unit
eras a1 a2 = do
  link Era a1
  link Era a2
