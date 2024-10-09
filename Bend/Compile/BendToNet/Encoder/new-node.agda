module Bend.Compile.BendToNet.Encoder.new-node where

open import Base.Nat.Nat
open import Base.Pair.Pair
open import Bend.Compile.BendToNet.Encoder.Encoder
open import Bend.Net.new-node renaming (new-node to net-new-node)
open import Bend.Net.NodeKind.NodeKind

-- Creates a fresh new node in the Encoder's net
-- - kind: The NodeKind of the new node
-- - enc: The current Encoder state
-- = A pair containing the new node's index and an Encoder with the updated net
new-node : NodeKind → Encoder → (Pair Nat Encoder)
new-node kind enc =
  let net = Encoder.net enc in
  let (idx , net) = net-new-node kind net in
  let enc = record enc { net = net } in
  (idx , enc)

