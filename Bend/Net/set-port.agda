module Bend.Net.set-port where

open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Data.Map.get renaming (get to map-get)
open import Data.Map.set renaming (set to map-set)
open import Bend.Net.Type
open import Bend.Net.Port.Type
open import Bend.Net.Node.set renaming (set to node-set)

-- Sets the value of a port in a net
set-port : Net → Port → Port → Maybe Net
set-port (MkNet nodes len name) port-a port-b = do
  let key = nat-to-bits (Port.node-id port-a)
  a ← map-get nodes key
  a ← node-set a (Port.slot-id port-a) port-b
  let nodes = map-set nodes key a
  Some (MkNet nodes len name)
