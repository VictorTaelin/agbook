module Imp.Type where

open import Data.Nat.Type
open import Data.Bool.Type
open import Data.U64.Type
open import Data.List.Type

-- Expression type
data Expr : Set where
  Var : Nat → Expr
  Num : U64 → Expr
  Add : Expr → Expr → Expr
  Sub : Expr → Expr → Expr
  Mul : Expr → Expr → Expr
  Div : Expr → Expr → Expr
  And : Expr → Expr → Expr
  Or  : Expr → Expr → Expr
  Not : Expr → Expr
  Eq  : Expr → Expr → Expr
  Lt  : Expr → Expr → Expr

-- Statement type
data Stmt : Set where
  VSet  : Nat → Expr → Stmt
  If    : Expr → Stmt → Stmt → Stmt
  While : Expr → Stmt → Stmt
  Block : List Stmt → Stmt

-- Program type
record Prog : Set where
  field
    vars : Nat  -- Number of registers
    body : Stmt -- Prog body

-- This completes the type definition for an Imp program
