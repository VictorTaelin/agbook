module HVM2.Run.State.Type where

open import HVM2.Net.Type
open import HVM2.Term.Type
open import Data.Map.Type
open import Data.Bits.Type

-- HVM2's global state
record State : Set where
  constructor MkState
  field
    gnet : Net
    subs : Map Term
    vars : Bits
