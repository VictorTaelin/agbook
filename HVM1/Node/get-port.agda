module HVM1.Node.get-port where

open import Data.Bits.Type
open import Data.Nat.Type
open import HVM1.Node.Type
open import HVM1.Port.Type

-- Gets the port of a node at a given slot.
-- - node: The node to query.
-- - slot: The slot number (0, 1, or 2).
-- = The port at the specified slot.
get-port : Node → Nat → Port
get-port (Con _ p0 _ _) 0 = p0
get-port (Con _ _ p1 _) 1 = p1
get-port (Con _ _ _ p2) 2 = p2
get-port (Dup _ p0 _ _) 0 = p0
get-port (Dup _ _ p1 _) 1 = p1
get-port (Dup _ _ _ p2) 2 = p2
get-port _              _ = To E 0
