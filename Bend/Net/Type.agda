module Bend.Net.Type where

open import Base.BitMap.Type using (BitMap)
open import Base.Nat.Type
open import Bend.Net.Node.Type
open import Base.String.Type

record Net : Set where
  constructor MkNet
  field
    nodes : BitMap Node
    len   : Nat
    name  : String
