module HVM1.Run.node-mut where

open import Base.Bits.Type
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Unit.Type
open import HVM1.Node.Type
open import HVM1.Run.Type
open import HVM1.Run.Monad.bind
open import HVM1.Run.Monad.pure
open import HVM1.Run.node-get
open import HVM1.Run.node-set

node-mut : Bits -> (Node -> Node) -> Run (Maybe Unit)
node-mut addr f = do
  m-node <- node-get addr
  case m-node of λ where
    (Some node) -> do
      node-set addr (f node)
      pure (Some unit)
    None -> pure None
