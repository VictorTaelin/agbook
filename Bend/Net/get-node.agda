module Bend.Net.get-node where

open import Base.BitMap.get renaming (get to map-get)
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Nat.Nat
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Base.Pair.Pair
open import Bend.Net.Net
open import Bend.Net.Node.Node

get-node : Net -> Nat -> Maybe (Pair Node Net)
get-node (MkNet nodes len name) node-id = do
  let key = nat-to-bits node-id
  a <- map-get nodes key
  Some (a , MkNet nodes len name)
