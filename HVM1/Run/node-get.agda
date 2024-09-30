module HVM1.Run.node-get where

import Base.BitMap.BitMap as M
import Base.BitMap.get as M
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import HVM1.Net.Net
open import HVM1.Node.Node
open import HVM1.Run.State.State
open import HVM1.Run.Run
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure
open import HVM1.Run.state-get

node-get : Bits → Run (Maybe Node)
node-get addr = do
  state <- state-get
  pure (M.get (Net.net (State.net state)) addr)
