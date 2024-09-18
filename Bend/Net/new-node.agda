module Bend.Net.new-node where

open import Base.Nat.to-bits
open import Base.Nat.Type
open import Base.Pair.Type
open import Base.Map.set
open import Bend.Net.Type
open import Bend.Net.Node.Type
open import Bend.Net.NodeKind.Type
open import Bend.Net.Port.Type

new-node : NodeKind → Net → (Pair Nat Net)
new-node kind (MkNet nodes len name) =
  let node = MkNode (MkPort len 0) (MkPort len 1) (MkPort len 2) kind in
  let map = (set nodes (to-bits len) node) in
  let net = MkNet map (Succ len) name in
  (len , net)
