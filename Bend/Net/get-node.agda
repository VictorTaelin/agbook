module Bend.Net.get-node where

open import Data.Map.get renaming (get to map-get)
open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Nat.Type
open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Data.Pair.Type
open import Bend.Net.Type
open import Bend.Net.Node.Type

get-node : Net → Nat → Maybe (Pair Node Net)
get-node (MkNet nodes len name) node-id = do
  let key = nat-to-bits node-id
  a ← map-get nodes key
  Some (a , MkNet nodes len name)
