module Imp.Eval.Block.State.Type where

open import Imp.Eval.Thread.State.Type
open import Data.U64.Type
open import Data.Buffer.Type
open import Data.Queue.Type

record Block : Set where
  constructor MkBlock
  field
    bid     : U64          -- id of this block
    memory  : Buffer       -- shared memory
    threads : Queue Thread -- thread states
