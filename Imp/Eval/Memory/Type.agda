module Imp.Eval.Memory.Type where

open import Base.Buffer.Type

-- A pair of global and shared memory
record Memory : Set where
  constructor MkMemory
  field
    global : Buffer
    shared : Buffer
