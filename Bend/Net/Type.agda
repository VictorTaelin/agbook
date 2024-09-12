module Bend.Net.Type where

open import Data.Map.Type using (Map)
open import Data.Nat.Type using (Nat)
open import Bend.Net.Node.Type using (Node)
open import Data.String.Type using (String)

record Net : Set where
  constructor MkNet
  field
    nodes : Map Node
    len   : Nat
    name  : String
