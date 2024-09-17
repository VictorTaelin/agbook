module HVM1.Run.mut-node where

open import Data.Bits.Type
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Unit.Type
open import HVM1.Node.Type
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.pure
open import HVM1.Run.get-node
open import HVM1.Run.set-node

mut-node : Bits → (Node → Node) → Run (Maybe Unit)
mut-node addr f = do
  m-node ← get-node addr
  case m-node of λ where
    (Some node) → do
      set-node addr (f node)
      pure (Some unit)
    None → pure None
