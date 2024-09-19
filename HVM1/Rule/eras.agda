module HVM1.Rule.eras where

open import Base.Bits.Type
open import Base.Unit.Type
open import HVM1.Port.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.pure
open import HVM1.Run.fresh
open import HVM1.Run.node-set
open import HVM1.Run.link
open import HVM1.Node.Type

eras : Port → Port → Port → Run Unit
eras p0 p1 p2 = do
  B1-loc ← fresh
  B2-loc ← fresh
  node-set B1-loc Era
  node-set B2-loc Era
  link (To B1-loc 0) p1
  link (To B2-loc 0) p2
  pure unit
