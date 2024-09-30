module HVM1.Rule.anni where

open import Base.Bits.Bits
open import Base.Unit.Unit
open import HVM1.Port.Port
open import HVM1.Run.Run
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure
open import HVM1.Run.node-set
open import HVM1.Run.link
open import HVM1.Node.Node

anni : Bits → Port → Port → Port → Bits → Port → Port → Port → Run Unit
anni ak a0 a1 a2 bk b0 b1 b2 = do
  node-set (Port.addr a0) Era
  node-set (Port.addr b0) Era
  link a1 b1
  link a2 b2
  pure unit
