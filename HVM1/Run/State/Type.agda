module HVM1.Run.State.Type where

open import HVM1.Net.Type
open import Base.Bits.Type

-- HVM1's global state
record State : Set where
  constructor MkState
  field
    net : Net
    ids : Bits
