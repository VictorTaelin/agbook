module Bend.Net.new where

open import Bend.Net.Net
open import Bend.Net.Port.Port
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.NodeKind
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Base.BitMap.set renaming (set to map-set)
open import Base.BitMap.new renaming (new to map-new)
open import Base.String.String

-- Creates a new flattened num-indexed net, with root represented by a deadlocked node.
new : String → Net
new name =
  let root = MkNode (MkPort 0 2) (MkPort 0 1) (MkPort 0 0) NodeKind.Rot in
  let map = map-set map-new (nat-to-bits 0) root in
  MkNet map 1 name
