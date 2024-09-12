module Imp.Stmt.Type where

open import Imp.Expr.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.U64.Type
open import Data.List.Type

-- Statement type
data Stmt : Set where
  -- Variable Assignments
  LSet : String → Expr → Stmt -- set local variable

  -- TODO(enricozb): the atomic operations don't specify a memory order
  SSet : Nat → Expr → Stmt -- set shared variable atomically
  GSet : Nat → Expr → Stmt -- set global variable atomically

  -- Control Flow
  If     : Expr → Stmt → Stmt
  ElseIf : Expr → Stmt → Stmt
  Else   : Stmt → Stmt
  While  : Expr → Stmt → Stmt
  Ret    : Expr → Stmt
  Cont   : Stmt
  Break  : Stmt
  Then   : Stmt → Stmt → Stmt

  -- Executes an expression and drops the value
  Ignore : Expr → Stmt
