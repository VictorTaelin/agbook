module Imp.Eval.Grid.Type where

open import Imp.Stmt.Type
open import Imp.Eval.Block.Type
open import Data.Nat.Type
open import Data.List.Type

-- A grid of blocks to execute in parallel sharing global memory.
record Grid : Set where
  constructor MkGrid
  field
    memory : Nat        -- global memory size
    blocks : List Block -- the blocks to execute
