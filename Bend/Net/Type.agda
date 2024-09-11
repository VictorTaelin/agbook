
module Bend.Net.Type where

open import Data.Map.Type using (Map)
open import Data.Nat.Type using (Nat)
open import Bend.Net.Node.Type using (Node)

record Net : Set where
  constructor MkNet
  field
    nodes : Map Node
    len   : Nat
