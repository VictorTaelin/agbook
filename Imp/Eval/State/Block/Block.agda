module Imp.Eval.State.Block.Block where

open import Base.Buffer.Buffer
open import Base.Queue.Queue
open import Base.U64.U64
open import Imp.Eval.State.Thread.Thread

record Block : Set where
  constructor MkBlock
  field
    bid     : U64          -- id of this block
    memory  : Buffer       -- shared memory
    threads : Queue Thread -- thread states

