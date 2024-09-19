module HVM1.Node.port-set where

open import HVM1.Node.Type
open import HVM1.Port.Type
open import Base.Nat.Type

-- Sets the port of a node at a given slot.
-- - node: The node to modify.
-- - slot: The slot number (0, 1, or 2).
-- - port: The new port to set.
-- = The modified node with the new port set at the specified slot.
port-set : Node → Nat → Port → Node
port-set (Con tag _  p1 p2) 0 px = Con tag px p1 p2
port-set (Con tag p0 _  p2) 1 px = Con tag p0 px p2
port-set (Con tag p0 p1 _ ) 2 px = Con tag p0 p1 px
port-set (Dup tag _  p1 p2) 0 px = Dup tag px p1 p2
port-set (Dup tag p0 _  p2) 1 px = Dup tag p0 px p2
port-set (Dup tag p0 p1 _ ) 2 px = Dup tag p0 p1 px
port-set node               _ _  = node
