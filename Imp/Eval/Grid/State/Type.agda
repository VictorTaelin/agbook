module Imp.Eval.Grid.State.Type where

open import Imp.Eval.Block.State.Type
open import Data.Buffer.Type
open import Data.Queue.Type

record Grid : Set where
  constructor MkGrid
  field
    memory : Buffer      -- global memory
    blocks : Queue Block -- block states
