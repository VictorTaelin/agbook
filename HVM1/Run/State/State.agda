module HVM1.Run.State.State where

open import HVM1.Net.Net
open import Base.Bits.Bits

-- HVM1's global state
record State : Set where
  constructor MkState
  field
    net : Net
    ids : Bits
