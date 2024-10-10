module Bend.Compile.NetToHvm.State.new where

open import Base.BinMap.BinMap
open import Base.BinMap.new renaming (new to map-new)
open import Base.Nat.Nat
open import Bend.Compile.NetToHvm.State.State

new : Nat → State
new n-nodes = MkState map-new 0 (Succ n-nodes)

