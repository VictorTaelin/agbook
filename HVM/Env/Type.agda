module HVM.Env.Type where

open import Data.Bits.Type
open import Data.Map.Type
open import HVM.Term.Type

-- Represents the HVM evaluator state:
-- - var: The current fresh variable counter.
-- - sub: A Map of substitutions (var to term).
record Env : Set where
  constructor New
  field
    var : Bits
    sub : Map Term
