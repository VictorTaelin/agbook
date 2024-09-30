module HVM1.Node.Node where

open import Base.Bits.Bits
open import Base.Nat.Nat
open import HVM1.Port.Port

-- Represents a node in the HVM1 system
data Node : Set where
  Con : (tag : Bits) → (p0 p1 p2 : Port) → Node
  Dup : (tag : Bits) → (p0 p1 p2 : Port) → Node
  Era : Node
