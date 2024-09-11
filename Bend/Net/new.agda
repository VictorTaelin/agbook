module Bend.Net.new where

open import Bend.Net.Type
open import Bend.Net.Port.Type
open import Bend.Net.Node.Type
open import Bend.Net.NodeKind.Type
open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Data.Map.set renaming (set to map-set)
open import Data.Map.new renaming (new to map-new)

-- Creates a new flattened num-indexed net, with root represented by a deadlocked node.
new : Net
new = 
  let root = MkNode (MkPort 0 2) (MkPort 0 1) (MkPort 0 0) NodeKind.Rot in
  let map = map-set map-new (nat-to-bits 0) root in
  MkNet map 1
