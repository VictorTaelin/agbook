module Imp.Eval.State.Grid.Type where

open import Base.Buffer.Type
open import Base.Queue.Type
open import Imp.Eval.State.Block.Type

record Grid : Set where
  constructor MkGrid
  field
    memory : Buffer      -- global memory
    blocks : Queue Block -- block states
