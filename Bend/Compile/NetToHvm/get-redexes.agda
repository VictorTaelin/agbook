module Bend.Compile.NetToHvm.get-redexes where

open import Data.Bool.if
open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.List.Type
open import Data.List.unzip
open import Data.Pair.Type
open import Data.Map.Type using (Map)
open import Data.Map.new renaming (new to map-new)
open import Data.Map.set renaming (set to map-set)
open import Data.Map.to-list
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Nat.min
open import Data.Nat.to-bits renaming (to-bits to to-bits)
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Bend.Net.Type
open import Bend.Net.Node.Type
open import Bend.Net.Port.Type

-- Returns the redexes of the net as pairs of node indices
get-redexes : Net → List (Pair Nat Nat)
get-redexes net =
  let redexes = check-nodes (to-list (Net.nodes net)) map-new in
  let (_ , redexes) = unzip (to-list redexes) in
  redexes
  where

  -- Check each node in the net, if it's part of a redex, add it to the map, using the smaller node id as the key
  check-nodes : List (Pair Bits Node) → Map (Pair Nat Nat) → Map (Pair Nat Nat)
  check-nodes [] map = map
  check-nodes ((key-a , node-a) :: nodes) map =
    let port-b = Node.main node-a in
    if (Port.slot-id port-b) == 0 then (
      -- A redex
      let key = to-bits (min (Port.node-id port-b) (to-nat key-a)) in
      let map = map-set map key (to-nat key-a , Port.node-id port-b) in
      check-nodes nodes map
    ) else
      -- Not a redex, continue
      check-nodes nodes map
