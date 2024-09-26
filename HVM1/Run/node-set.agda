module HVM1.Run.node-set where

import Base.BitMap.BitMap as M
import Base.BitMap.set as M
open import Base.Bits.Bits
open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM1.Net.Net
open import HVM1.Node.Node
open import HVM1.Run.State.State
open import HVM1.Run.Run
open import HVM1.Run.Monad.bind
open import HVM1.Run.state-mut

node-set : Bits -> Node -> Run Unit
node-set addr node = state-mut λ state -> do
  let net = State.net state
  let net = MkNet (M.set (Net.net net) addr node)
  record state { net = net }
