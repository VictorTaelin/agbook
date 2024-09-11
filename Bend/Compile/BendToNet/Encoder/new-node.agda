module Bend.Compile.BendToNet.Encoder.new-node where

open import Data.Nat.Type
open import Data.Pair.Type
open import Bend.Compile.BendToNet.Encoder.Type
open import Bend.Net.new-node renaming (new-node to net-new-node)
open import Bend.Net.NodeKind.Type

new-node : NodeKind → Encoder → (Pair Nat Encoder)
new-node kind enc =
  let net = Encoder.net enc in
  let (idx , net) = net-new-node kind net in
  let enc = record enc { net = net } in
  (idx , enc)
