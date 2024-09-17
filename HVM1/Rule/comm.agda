module HVM1.Rule.comm where

open import Data.Bits.Type
open import Data.Unit.Type
open import HVM1.Port.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.pure
open import HVM1.Run.fresh
open import HVM1.Run.node-set
open import HVM1.Run.link
open import HVM1.Node.Type

comm : Bits → Port → Port → Port → Bits → Port → Port → Port → Run Unit
comm ak a0 a1 a2 bk b0 b1 b2 = do
  A1-loc ← fresh
  A2-loc ← fresh
  B1-loc ← fresh
  B2-loc ← fresh
  let A1 = Con bk (To A1-loc 0) (To A1-loc 1) (To A1-loc 2)
  let A2 = Con bk (To A2-loc 0) (To A2-loc 1) (To A2-loc 2)
  let B1 = Con ak (To B1-loc 0) (To B1-loc 1) (To B1-loc 2)
  let B2 = Con ak (To B2-loc 0) (To B2-loc 1) (To B2-loc 2)
  node-set A1-loc A1
  node-set A2-loc A2
  node-set B1-loc B1
  node-set B2-loc B2
  link (To A1-loc 1) (To B1-loc 1)
  link (To A1-loc 2) (To B2-loc 1)
  link (To A2-loc 1) (To B1-loc 2)
  link (To A2-loc 2) (To B2-loc 2)
  link (To A1-loc 0) a1
  link (To A2-loc 0) a2
  link (To B1-loc 0) b1
  link (To B2-loc 0) b2
  pure unit
