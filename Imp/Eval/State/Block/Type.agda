module Imp.Eval.State.Block.Type where

open import Base.Buffer.Type
open import Base.Queue.Type
open import Base.U64.Type
open import Imp.Eval.State.Thread.Type

record Block : Set where
  constructor MkBlock
  field
    bid     : U64          -- id of this block
    memory  : Buffer       -- shared memory
    threads : Queue Thread -- thread states
