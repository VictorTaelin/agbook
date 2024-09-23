module Imp.Eval.Grid.Config.Type where

open import Imp.Stmt.Type
open import Imp.Eval.Block.Config.Type
open import Base.Nat.Type
open import Base.List.Type

-- A grid of blocks to execute in parallel sharing global memory.
record Grid : Set where
  constructor MkGrid
  field
    memory : Nat        -- global memory size
    blocks : List Block -- the blocks to execute
