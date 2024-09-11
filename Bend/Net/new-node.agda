module Bend.Net.new-node where

open import Data.Nat.to-bits
open import Data.Nat.Type
open import Data.Pair.Type
open import Data.Map.set
open import Bend.Net.Type
open import Bend.Net.Node.Type
open import Bend.Net.NodeKind.Type
open import Bend.Net.Port.Type

new-node : NodeKind → Net → (Pair Nat Net)
new-node kind (MkNet nodes len) =
  let node = MkNode (MkPort len 0) (MkPort len 1) (MkPort len 2) kind in
  let map = (set nodes (to-bits len) node) in
  let net = MkNet map (Succ len) in
  (len , net)
