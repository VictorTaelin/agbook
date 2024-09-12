module Bend.Compile.NetToHvm.nets-to-hvm where

open import Data.List.Type
open import Data.Pair.Type
open import Data.Result.Type
open import Data.Result.bind
open import Data.String.Type
open import Bend.Net.Type renaming (Net to BNet)
open import HVM2.Net.Type renaming (Net to HNet)
open import Bend.Compile.NetToHvm.net-to-hvm

nets-to-hvm : List BNet → Result (List (Pair String HNet)) String
nets-to-hvm [] = Done []
nets-to-hvm (net :: nets) = do
  let name = BNet.name net
  net ← net-to-hvm net
  nets ← nets-to-hvm nets
  Done ((name , net) :: nets)
