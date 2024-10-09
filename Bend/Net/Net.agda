module Bend.Net.Net where

open import Base.BinMap.BinMap using (BinMap)
open import Base.Nat.Nat
open import Bend.Net.Node.Node
open import Base.String.String

record Net : Set where
  constructor MkNet
  field
    nodes : BinMap Node
    len   : Nat
    name  : String

