module Imp.Eval.State.Grid.Grid where

open import Base.Buffer.Buffer
open import Base.Queue.Queue
open import Imp.Eval.State.Block.Block

record Grid : Set where
  constructor MkGrid
  field
    memory : Buffer      -- global memory
    blocks : Queue Block -- block states
