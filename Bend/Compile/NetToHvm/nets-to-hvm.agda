module Bend.Compile.NetToHvm.nets-to-hvm where

open import Base.List.Type
open import Base.Pair.Type
open import Base.Result.Type
open import Base.Result.bind
open import Base.String.Type
open import Bend.Net.Type renaming (Net to BNet)
open import HVM2.Net.Type renaming (Net to HNet)
open import Bend.Compile.NetToHvm.net-to-hvm

-- Converts a list of Bend Nets to a list of named HVM Nets.
-- - nets: The list of Bend Nets to convert.
-- = A Result containing either:
--   - A list of pairs, each consisting of:
--     - The name of the original Bend Net
--     - The converted HVM Net
--   - An error message if any conversion fails
nets-to-hvm : List BNet → Result (List (Pair String HNet)) String
nets-to-hvm [] = Done []
nets-to-hvm (net :: nets) = do
  let name = BNet.name net
  net ← net-to-hvm net
  nets ← nets-to-hvm nets
  Done ((name , net) :: nets)
