
module Bend.Net.Type where

open import Base.Map.Type using (Map)
open import Base.Nat.Type using (Nat)
open import Bend.Net.Node.Type using (Node)
open import Base.String.Type using (String)

record Net : Set where
  constructor MkNet
  field
    nodes : Map Node
    len   : Nat
    name  : String
