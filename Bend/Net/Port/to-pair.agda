module Bend.Net.Port.to-pair where

open import Bend.Net.Port.Type
open import Base.Pair.Type
open import Base.Nat.Type

-- Converts a Port to a Pair of Nat
-- - port: The Port to convert
-- = A Pair containing the node-id and slot-id of the Port
to-pair : Port → Pair Nat Nat
to-pair (MkPort node-id slot-id) = node-id , slot-id
