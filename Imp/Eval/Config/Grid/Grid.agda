module Imp.Eval.Config.Grid.Grid where

open import Base.List.List
open import Base.Nat.Nat
open import Imp.Stmt.Stmt

-- A grid of blocks to execute in parallel sharing global memory.
record Grid : Set where
  constructor MkGrid
  field
    global  : Nat  -- global memory size
    shared  : Nat  -- shared (per block) memory size
    blocks  : Nat  -- number of blocks
    threads : Nat  -- number of threads per blocks
    code    : Stmt -- the code to execute on each thread

