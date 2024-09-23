module Imp.Eval.Thread.State.Type where

open import Imp.Stmt.Type
open import Imp.Eval.Frame.Type
open import Imp.Eval.Env.Type
open import Base.List.Type
open import Base.U64.Type
open import Base.Maybe.Type

record Thread : Set where
  constructor MkThread
  field
    tid    : U64        -- id of this thread
    vars   : Env        -- local variables
    stmt   : Maybe Stmt -- the current statement
    frames : List Frame -- the stack of frames
