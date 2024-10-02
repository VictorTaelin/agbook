module Imp.Expr.Expr where

open import Base.Bool.Bool
open import Base.List.List
open import Base.Nat.Nat
open import Base.String.String
open import Base.U64.U64

-- Expression type
data Expr : Set where
  -- Local variable read
  Var : String → Expr

  -- Grid indices
  Tid : Expr -- thread id
  Bid : Expr -- block id
  Gid : Expr -- global id

  -- Numeric operations
  Num : U64 → Expr
  Add : Expr → Expr → Expr
  Sub : Expr → Expr → Expr
  Mul : Expr → Expr → Expr
  Div : Expr → Expr → Expr
  Mod : Expr → Expr → Expr
  And : Expr → Expr → Expr
  Or  : Expr → Expr → Expr
  Not : Expr → Expr

  -- Comparisons
  Eq  : Expr → Expr → Expr
  Neq : Expr → Expr → Expr
  Lt  : Expr → Expr → Expr
  Le  : Expr → Expr → Expr
  Gt  : Expr → Expr → Expr
  Ge  : Expr → Expr → Expr

  -- Conditional
  Cond : Expr → Expr → Expr → Expr

  -- Atomics
  -- TODO(enricozb): the atomic operations don't specify a memory order
  SGet : (var : Expr) → Expr -- Atomically reads shared `var`.
  GGet : (var : Expr) → Expr -- Atomically reads global `var`.
  SAdd : (var : Expr) → (inc : Expr) → Expr -- Adds `inc` to shared `var` returning the old value.
  GAdd : (var : Expr) → (inc : Expr) → Expr -- Adds `inc` to global `var` returning the old value.
  SExc : (var : Expr) → (new : Expr) → Expr -- Writes `new` to shared `var` returning the old value.
  GExc : (var : Expr) → (new : Expr) → Expr -- Writes `new` to global `var` returning the old value.
