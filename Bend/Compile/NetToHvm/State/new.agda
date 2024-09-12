module Bend.Compile.NetToHvm.State.new where

open import Data.Map.Type
open import Data.Map.new renaming (new to map-new)
open import Data.Nat.Type
open import Bend.Compile.NetToHvm.State.Type

new : Nat → State
new n-nodes = MkState map-new 0 (Succ n-nodes)
