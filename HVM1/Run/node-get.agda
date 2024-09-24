module HVM1.Run.node-get where

import Base.BitMap.Type as M
import Base.BitMap.get as M
open import Base.Bits.Type
open import Base.Maybe.Type
open import HVM1.Net.Type
open import HVM1.Node.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure
open import HVM1.Run.state-get

node-get : Bits -> Run (Maybe Node)
node-get addr = do
  state <- state-get
  pure (M.get (Net.net (State.net state)) addr)
