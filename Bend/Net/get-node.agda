module Bend.Net.get-node where

open import Base.Map.get renaming (get to map-get)
open import Base.Maybe.Type
open import Base.Maybe.bind
open import Base.Nat.Type
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Base.Pair.Type
open import Bend.Net.Type
open import Bend.Net.Node.Type

get-node : Net → Nat → Maybe (Pair Node Net)
get-node (MkNet nodes len name) node-id = do
  let key = nat-to-bits node-id
  a ← map-get nodes key
  Some (a , MkNet nodes len name)
