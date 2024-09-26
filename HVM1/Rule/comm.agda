module HVM1.Rule.comm where

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

comm : Bits -> Port -> Port -> Port -> Bits -> Port -> Port -> Port -> Run Unit
comm ak a0 a1 a2 bk b0 b1 b2 = do
  A1 <- fresh
  A2 <- fresh
  B1 <- fresh
  B2 <- fresh
  node-set A1 (Con bk (To A1 0) (To B1 1) (To B2 1))
  node-set A2 (Con bk (To A2 0) (To B1 2) (To B2 2))
  node-set B1 (Con ak (To B1 0) (To A1 1) (To A2 1))
  node-set B2 (Con ak (To B2 0) (To A1 2) (To A2 2))
  link (To A1 0) a1
  link (To A2 0) a2
  link (To B1 0) b1
  link (To B2 0) b2
  pure unit
