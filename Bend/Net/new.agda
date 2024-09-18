module Bend.Net.new where

open import Bend.Net.Type
open import Bend.Net.Port.Type
open import Bend.Net.Node.Type
open import Bend.Net.NodeKind.Type
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Base.Map.set renaming (set to map-set)
open import Base.Map.new renaming (new to map-new)
open import Base.String.Type

-- Creates a new flattened num-indexed net, with root represented by a deadlocked node.
new : String → Net
new name = 
  let root = MkNode (MkPort 0 2) (MkPort 0 1) (MkPort 0 0) NodeKind.Rot in
  let map = map-set map-new (nat-to-bits 0) root in
  MkNet map 1 name
