module Imp.Eval.Memory.Memory where

open import Base.Buffer.Buffer

-- A pair of global and shared memory
record Memory : Set where
  constructor MkMemory
  field
    global : Buffer
    shared : Buffer

