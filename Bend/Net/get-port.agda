module Bend.Net.get-port where

open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Base.BitMap.get renaming (get to map-get)
open import Base.BitMap.set renaming (set to map-set)
open import Bend.Net.Net
open import Bend.Net.Port.Port
open import Bend.Net.Node.get renaming (get to node-get)

get-port : Net → Port → Maybe Port
get-port (MkNet nodes len name) (MkPort node-id slot-id) = do
  let key = nat-to-bits node-id
  a <- map-get nodes key
  p <- node-get a slot-id
  Some p
