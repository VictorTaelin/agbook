module Imp.Eval.State.Thread.Thread where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.U64.U64
open import Imp.Eval.Env.Env
open import Imp.Eval.Frame.Frame
open import Imp.Stmt.Stmt

record Thread : Set where
  constructor MkThread
  field
    tid    : U64        -- id of this thread within the block
    gid    : U64        -- id of this thread within the grid
    vars   : Env        -- local variables
    stmt   : Maybe Stmt -- the current statement
    frames : List Frame -- the stack of frames

