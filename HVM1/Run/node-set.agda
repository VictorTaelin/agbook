module HVM1.Run.node-set where

import Base.Map.Type as M
import Base.Map.set as M
open import Base.Bits.Type
open import Base.Pair.Type
open import Base.Unit.Type
open import HVM1.Net.Type
open import HVM1.Node.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.state-mut

node-set : Bits → Node → Run Unit
node-set addr node = state-mut λ state → do
  let net = State.net state
  let net = MkNet (M.set (Net.net net) addr node)
  record state { net = net }
