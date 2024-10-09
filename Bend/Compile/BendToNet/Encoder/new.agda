module Bend.Compile.BendToNet.Encoder.new where

open import Bend.Compile.BendToNet.Encoder.Encoder
open import Bend.Net.new renaming (new to net-new)
open import Base.BinMap.new renaming (new to map-new)
open import Base.List.List
open import Base.String.String

-- Creates a new Encoder with empty net and var map
-- - name: The name for the new net
-- = A new Encoder with initialized components
new : String → Encoder
new name = MkEncoder (net-new name) map-new

