module HVM.Env.Type where

open import Data.Bits.Type
open import Data.Map.Type
open import HVM.Term.Type

record Env : Set where
  constructor Env
  field
    var : Bits
    sub : Map Term
