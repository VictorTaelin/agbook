module Bend.Net.get-port where

open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Data.Map.get renaming (get to map-get)
open import Data.Map.set renaming (set to map-set)
open import Bend.Net.Type
open import Bend.Net.Port.Type
open import Bend.Net.Node.get renaming (get to node-get)

get-port : Net → Port → Maybe Port
get-port (MkNet nodes len name) (MkPort node-id slot-id) = do
  let key = nat-to-bits node-id
  a ← map-get nodes key
  p ← node-get a slot-id
  Some p
