module Imp.Eval.Config.Grid.Grid where

open import Base.List.List
open import Base.Nat.Nat
open import Imp.Eval.Config.Block.Block
open import Imp.Stmt.Stmt

-- A grid of blocks to execute in parallel sharing global memory.
record Grid : Set where
  constructor MkGrid
  field
    memory : Nat        -- global memory size
    blocks : List Block -- the blocks to execute
