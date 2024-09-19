module Imp.Eval.Thread.State.Type where

open import Data.U64.Type
open import Imp.Stmt.Type

record Thread : Set where
  constructor MkThread
  field
    tid  : U64            -- id of this thread
    vars : Map String U64 -- local variables
    stmt : Stmt           -- the current statement
