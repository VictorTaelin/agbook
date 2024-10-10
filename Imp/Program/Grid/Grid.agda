module Imp.Program.Grid.Grid where

open import Base.Nat.Nat
open import Imp.Stmt.Stmt

-- A grid of blocks to execute in parallel.
record Grid : Set where
  constructor MkGrid
  field
    shared  : Nat  -- shared (per block) memory size
    blocks  : Nat  -- number of blocks
    threads : Nat  -- number of threads per blocks
    code    : Stmt -- the code to execute on each thread

