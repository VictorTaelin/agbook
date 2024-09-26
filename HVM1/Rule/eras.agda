module HVM1.Rule.eras where

open import Base.Bits.Bits
open import Base.Unit.Unit
open import HVM1.Port.Port
open import HVM1.Run.Run
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure
open import HVM1.Run.fresh
open import HVM1.Run.node-set
open import HVM1.Run.link
open import HVM1.Node.Node

eras : Port -> Port -> Port -> Run Unit
eras p0 p1 p2 = do
  B1-loc <- fresh
  B2-loc <- fresh
  node-set B1-loc Era
  node-set B2-loc Era
  link (To B1-loc 0) p1
  link (To B2-loc 0) p2
  pure unit
