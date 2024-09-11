module Bend.Compile.BendToNet.Encoder.new where

open import Bend.Compile.BendToNet.Encoder.Type
open import Bend.Net.new renaming (new to net-new)
open import Data.Map.new renaming (new to map-new)
open import Data.List.Type
open import Data.String.Type

new : String → Encoder
new name = MkEncoder (net-new name) map-new []
