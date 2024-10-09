module Bend.Net.set-port where

open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Base.BinMap.get renaming (get to map-get)
open import Base.BinMap.set renaming (set to map-set)
open import Bend.Net.Net
open import Bend.Net.Port.Port
open import Bend.Net.Node.set renaming (set to node-set)

-- Sets the value of a port in a net
set-port : Net → Port → Port → Maybe Net
set-port (MkNet nodes len name) port-a port-b = do
  let key   = nat-to-bits (Port.node port-a)
  a         <- map-get nodes key
  a         <- node-set a (Port.slot port-a) port-b
  let nodes = map-set nodes key a
  Some (MkNet nodes len name)
