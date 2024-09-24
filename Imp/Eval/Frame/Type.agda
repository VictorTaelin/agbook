module Imp.Eval.Frame.Type where

open import Base.U64.Type
open import Imp.Expr.Type
open import Imp.Stmt.Type

-- Frames are exceptional control flow boundaries. Statements such as
-- returns, breaks, and continues will (partially) unwind a thread's
-- stack of frames. Frames contain information on how to continue a
-- thread's execution.
data Frame : Set where
  -- If a return is encountered, plug its value into the function
  -- and continue exection of the resulting statement.
  Fun  : (U64 → Stmt) → Frame
  -- A loop's test condition and body
  Loop : Expr → Stmt → Frame
