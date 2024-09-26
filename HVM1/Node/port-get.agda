module HVM1.Node.port-get where

open import Base.Bits.Bits
open import Base.Nat.Nat
open import HVM1.Node.Node
open import HVM1.Port.Port

-- Gets the port of a node at a given slot.
-- - node: The node to query.
-- - slot: The slot number (0, 1, or 2).
-- = The port at the specified slot.
port-get : Node -> Nat -> Port
port-get (Con _ p0 _ _) 0 = p0
port-get (Con _ _ p1 _) 1 = p1
port-get (Con _ _ _ p2) 2 = p2
port-get (Dup _ p0 _ _) 0 = p0
port-get (Dup _ _ p1 _) 1 = p1
port-get (Dup _ _ _ p2) 2 = p2
port-get _              _ = To E 0
