module V2.add where

open import V2.Main
open import Nat.Main
open import Nat.add as NatAdd

-- Adds two V2 vectors
-- - v1: the first V2 vector
-- - v2: the second V2 vector
-- = a new V2 vector with the sum of the coordinates
add_v2 : V2 → V2 → V2
add_v2 (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (NatAdd.add x1 x2) (NatAdd.add y1 y2)
