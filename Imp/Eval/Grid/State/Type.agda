module Imp.Eval.Grid.State.Type where

open import Imp.Eval.Block.State.Type
open import Base.Buffer.Type
open import Base.Queue.Type

record Grid : Set where
  constructor MkGrid
  field
    memory : Buffer      -- global memory
    blocks : Queue Block -- block states
