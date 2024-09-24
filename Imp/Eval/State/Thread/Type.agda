module Imp.Eval.State.Thread.Type where

open import Base.List.Type
open import Base.Maybe.Type
open import Base.U64.Type
open import Imp.Eval.Env.Type
open import Imp.Eval.Frame.Type
open import Imp.Stmt.Type

record Thread : Set where
  constructor MkThread
  field
    tid    : U64        -- id of this thread
    vars   : Env        -- local variables
    stmt   : Maybe Stmt -- the current statement
    frames : List Frame -- the stack of frames
