module Bend.Net.link where

open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Data.Map.get renaming (get to map-get)
open import Data.Map.set renaming (set to map-set)
open import Data.Maybe.Type
open import Data.Maybe.bind
open import Bend.Net.Type
open import Bend.Net.Port.Type
open import Bend.Net.Node.set renaming (set to node-set)

link : Net → Port → Port → Maybe Net
link (MkNet nodes len) port-a port-b = do
  a ← map-get nodes (nat-to-bits (Port.node-id port-a))
  b ← map-get nodes (nat-to-bits (Port.node-id port-b))

  a ← node-set a (Port.slot-id port-a) port-b
  b ← node-set b (Port.slot-id port-b) port-a

  let nodes = map-set nodes (nat-to-bits (Port.node-id port-a)) a
  let nodes = map-set nodes (nat-to-bits (Port.node-id port-b)) b

  Some (MkNet nodes len)
