module Bend.Compile.NetToHvm.net-to-hvm where

open import Data.Result.Type
open import Data.Result.bind
open import Data.List.Type
open import Data.Maybe.Type
open import Data.Maybe.to-result
open import Data.Nat.Type
open import Data.Pair.Type
open import Data.String.Type
open import Bend.Net.Type renaming (Net to BNet)
open import Bend.Net.get-port
open import Bend.Net.net-root
open import HVM2.Net.Type renaming (Net to HNet)
open import HVM2.Redex.Type
open import Bend.Compile.NetToHvm.get-redexes
open import Bend.Compile.NetToHvm.tree-to-hvm
open import Bend.Compile.NetToHvm.State.Type
open import Bend.Compile.NetToHvm.State.new renaming (new to state-new)

-- Converts a Bend Net to an HVM Net.
-- - net: The Bend Net to convert.
-- = The converted HVM Net or an error message.
net-to-hvm : BNet → Result HNet String
net-to-hvm net = do
  let redexes = get-redexes net
  let state = state-new (BNet.len net)
  root ← to-result (get-port net net-root) "no root"
  (root , state) ← var-or-subtree-to-hvm net root state
  rbag ← go redexes state
  Done (MkNet rbag root)

  where

  -- Helper function to process the list of redexes.
  -- - redexes: List of redex pairs to process.
  -- - state: Current compilation state.
  -- = The list of HVM Redexes or an error message. 
  go : List (Pair Nat Nat) → State → Result (List Redex) String
  go [] state = Done []
  go ((a , b) :: redexes) state = do
    (a , state) ← tree-to-hvm net a state
    (b , state) ← tree-to-hvm net b state
    let redex = MkRedex a b
    redexes ← go redexes state
    Done (redex :: redexes)
