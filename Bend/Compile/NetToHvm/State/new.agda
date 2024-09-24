module Bend.Compile.NetToHvm.State.new where

open import Base.Map.Type
open import Base.Map.new renaming (new to map-new)
open import Base.Nat.Type
open import Bend.Compile.NetToHvm.State.Type

new : Nat -> State
new n-nodes = MkState map-new 0 (Succ n-nodes)
