module Imp.Program.Program where

open import Base.List.List
open import Base.Nat.Nat
open import Imp.Program.Grid.Grid

-- A list grids to run sequentially, sharing global memory.
record Program : Set where
  constructor MkProgram
  field
    global : Nat       -- global memory size
    grids  : List Grid -- sequence of grids
