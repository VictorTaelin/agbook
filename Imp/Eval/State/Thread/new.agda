module Imp.Eval.State.Thread.new where

import Imp.Eval.Env.new as Env
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.to-u64
open import Base.Nat.to-u64
open import Imp.Eval.State.Thread.Thread
open import Imp.Stmt.Stmt

new : (tid : Nat) → (gid : Nat) → (code : Stmt) → Thread
new tid gid code = MkThread (to-u64 tid) (to-u64 gid) Env.new (Some code) []
