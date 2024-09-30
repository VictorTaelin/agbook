module HVM1.Run.node-mut where

open import Base.Bits.Bits
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Unit.Unit
open import HVM1.Node.Node
open import HVM1.Run.Run
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure
open import HVM1.Run.node-get
open import HVM1.Run.node-set

node-mut : Bits → (Node → Node) → Run (Maybe Unit)
node-mut addr f = do
  m-node <- node-get addr
  case m-node of λ where
    (Some node) → do
      node-set addr (f node)
      pure (Some unit)
    None → pure None
