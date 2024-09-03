module HVM.State.Type where

open import HVM.Net.Type
open import HVM.Term.Type
open import Data.Map.Type
open import Data.Bits.Type

-- HVM's global state
record State : Set where
  constructor MkState
  field
    gnet : Net
    subs : Map Term
    vars : Bits
