module Imp.Eval.Config.Block.Type where

open import Base.Nat.Type
open import Imp.Stmt.Type

-- A block of threads that all execute the same code and share memory.
record Block : Set where
  constructor MkBlock
  field
    memory  : Nat  -- shared memory size
    threads : Nat  -- the number of threads
    code    : Stmt -- the code that every thread executes
