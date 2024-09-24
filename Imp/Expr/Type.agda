module Imp.Expr.Type where

open import Base.Bool.Type
open import Base.List.Type
open import Base.Nat.Type
open import Base.String.Type
open import Base.U64.Type

-- Expression type
data Expr : Set where
  -- Local variable read
  Var : String -> Expr

  -- Grid indices
  Tid : Expr -- thread id
  Bid : Expr -- block id

  -- Numeric operations
  Num : U64 -> Expr
  Add : Expr -> Expr -> Expr
  Sub : Expr -> Expr -> Expr
  Mul : Expr -> Expr -> Expr
  Div : Expr -> Expr -> Expr
  Mod : Expr -> Expr -> Expr
  And : Expr -> Expr -> Expr
  Or  : Expr -> Expr -> Expr
  Not : Expr -> Expr

  -- Comparisons
  Eq  : Expr -> Expr -> Expr
  Neq : Expr -> Expr -> Expr
  Lt  : Expr -> Expr -> Expr
  Le  : Expr -> Expr -> Expr
  Gt  : Expr -> Expr -> Expr
  Ge  : Expr -> Expr -> Expr

  -- Conditional
  Cond : Expr -> Expr -> Expr -> Expr

  -- Atomics
  -- TODO(enricozb): the atomic operations don't specify a memory order
  SGet : (var : Expr) -> Expr -- Atomically reads shared `var`.
  GGet : (var : Expr) -> Expr -- Atomically reads global `var`.
  SAdd : (var : Expr) -> (inc : Expr) -> Expr -- Adds `inc` to shared `var` returning the old value.
  GAdd : (var : Expr) -> (inc : Expr) -> Expr -- Adds `inc` to global `var` returning the old value.
  SExc : (var : Expr) -> (new : Expr) -> Expr -- Writes `new` to shared `var` returning the old value.
  GExc : (var : Expr) -> (new : Expr) -> Expr -- Writes `new` to global `var` returning the old value.
