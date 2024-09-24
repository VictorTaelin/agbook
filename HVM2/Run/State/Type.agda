module HVM2.Run.State.Type where

open import HVM2.Net.Type
open import HVM2.Term.Type
open import Base.BitMap.Type
open import Base.Bits.Type

-- HVM2's global state
record State : Set where
  constructor MkState
  field
    gnet : Net
    subs : BitMap Term
    vars : Bits
