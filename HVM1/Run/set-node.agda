module HVM1.Run.set-node where

import Data.Map.Type as M
import Data.Map.set as M
open import Data.Bits.Type
open import Data.Pair.Type
open import Data.Unit.Type
open import HVM1.Net.Type
open import HVM1.Node.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.mut-state

set-node : Bits → Node → Run Unit
set-node addr node = mut-state λ state → do
  let net = State.net state
  let net = MkNet (M.set (Net.net net) addr node)
  record state { net = net }
