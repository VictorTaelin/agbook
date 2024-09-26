module Bend.Net.Net where

open import Base.BitMap.BitMap using (BitMap)
open import Base.Nat.Nat
open import Bend.Net.Node.Node
open import Base.String.String

record Net : Set where
  constructor MkNet
  field
    nodes : BitMap Node
    len   : Nat
    name  : String
