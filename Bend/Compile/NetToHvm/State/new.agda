module Bend.Compile.NetToHvm.State.new where

open import Base.BitMap.Type
open import Base.BitMap.new renaming (new to map-new)
open import Base.Nat.Type
open import Bend.Compile.NetToHvm.State.Type

new : Nat -> State
new n-nodes = MkState map-new 0 (Succ n-nodes)
