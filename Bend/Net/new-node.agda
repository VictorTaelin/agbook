module Bend.Net.new-node where

open import Base.Nat.to-bits
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.BitMap.set
open import Bend.Net.Net
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Bend.Net.Port.Port

new-node : NodeKind -> Net -> (Pair Nat Net)
new-node kind (MkNet nodes len name) =
  let node = MkNode (MkPort len 0) (MkPort len 1) (MkPort len 2) kind in
  let map = (set nodes (to-bits len) node) in
  let net = MkNet map (Succ len) name in
  (len , net)
