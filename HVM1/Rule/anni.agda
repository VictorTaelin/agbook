module HVM1.Rule.anni where

open import Data.Bits.Type
open import Data.Unit.Type
open import HVM1.Port.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.pure
open import HVM1.Run.node-set
open import HVM1.Run.link
open import HVM1.Node.Type

anni : Bits → Port → Port → Port → Bits → Port → Port → Port → Run Unit
anni ak a0 a1 a2 bk b0 b1 b2 = do
  node-set (Port.addr a0) Era
  node-set (Port.addr b0) Era
  link a1 b1
  link a2 b2
  pure unit
