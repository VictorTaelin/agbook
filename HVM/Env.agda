module HVM.Env where

open import Data.Bits.Type
open import Data.Map.Type
open import HVM.Term

record Env : Set where
  constructor New
  field
    fresh : Bits
    subst : Map Term
