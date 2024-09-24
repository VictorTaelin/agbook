module Imp.Eval.Config.Grid.Type where

open import Base.List.Type
open import Base.Nat.Type
open import Imp.Eval.Config.Block.Type
open import Imp.Stmt.Type

-- A grid of blocks to execute in parallel sharing global memory.
record Grid : Set where
  constructor MkGrid
  field
    memory : Nat        -- global memory size
    blocks : List Block -- the blocks to execute
