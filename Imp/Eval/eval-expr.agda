module Imp.Eval.eval-expr where

import Base.Buffer.get as Buffer
import Base.Buffer.set as Buffer
import Base.Maybe.to-result as Maybe
import Imp.Eval.Env.get as Env
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.Result.Monad.bind
open import Base.Result.Result
open import Base.String.append
open import Base.String.Trait.Ord
open import Base.String.String
open import Base.Trait.Eq
open import Base.Trait.Ord
open import Base.U64.add
open import Base.U64.and
open import Base.U64.div
open import Base.U64.from-bool
open import Base.U64.if
open import Base.U64.mod
open import Base.U64.mul
open import Base.U64.not
open import Base.U64.or
open import Base.U64.sub
open import Base.U64.to-nat
open import Base.U64.Trait.Eq
open import Base.U64.Trait.Ord
open import Base.U64.U64
open import Imp.Eval.Env.Env
open import Imp.Eval.Memory.Memory
open import Imp.Expr.Expr

private
  EvalResult = Result (Pair Memory U64) String

interleaved mutual
  -- Evaluates an expression in the context of global/shared memory,
  -- the block and thread ids, and the local variables.
  -- The mutated memory and normalized value are returned.
  eval-expr : Memory → (bid : U64) → (tid : U64) → Env → Expr → EvalResult

  private
    -- used to evaluate binary operators
    bin-op : Memory → (bid : U64) → (tid : U64) → Env → Expr → Expr → (op : U64 → U64 → U64) → EvalResult

    bin-op memory bid tid vars a b op = do
      (memory , a) ← eval-expr memory bid tid vars a
      (memory , b) ← eval-expr memory bid tid vars b
      Done (memory , op a b)

  eval-expr memory bid tid vars expr with expr

  ... | (Var v) =
    case (Env.get vars v) of λ where
      (Some v) → Done (memory , v)
      None     → Fail ("unbound variable: " ++ v)

  ... | Bid = Done (memory , bid)
  ... | Tid = Done (memory , tid)

  ... | Num n = Done (memory , n)

  ... | Add a b = bin-op memory bid tid vars a b _+_
  ... | Sub a b = bin-op memory bid tid vars a b _-_
  ... | Mul a b = bin-op memory bid tid vars a b _*_
  ... | Div a b = bin-op memory bid tid vars a b _/_
  ... | Mod a b = bin-op memory bid tid vars a b mod
  ... | And a b = bin-op memory bid tid vars a b and
  ... | Or  a b = bin-op memory bid tid vars a b or

  ... | Eq  a b = bin-op memory bid tid vars a b (λ a b → from-bool (a == b))
  ... | Neq a b = bin-op memory bid tid vars a b (λ a b → from-bool (a != b))
  ... | Lt  a b = bin-op memory bid tid vars a b (λ a b → from-bool (a <  b))
  ... | Le  a b = bin-op memory bid tid vars a b (λ a b → from-bool (a <= b))
  ... | Gt  a b = bin-op memory bid tid vars a b (λ a b → from-bool (a >  b))
  ... | Ge  a b = bin-op memory bid tid vars a b (λ a b → from-bool (a >= b))

  ... | Not a  = do
    (memory , a) ← eval-expr memory bid tid vars a
    Done (memory , not a)

  ... | Cond e t f = do
    (memory , e) ← eval-expr memory bid tid vars e
    case (to-nat e) of λ where
      0 → eval-expr memory bid tid vars f
      _ → eval-expr memory bid tid vars t

  ... | SGet i = do
    (memory , i) ← eval-expr memory bid tid vars i
    v ← Maybe.to-result (Buffer.get (Memory.shared memory) i) "invalid access to shared memory"
    Done (memory , v)

  ... | GGet i = do
    (memory , i) ← eval-expr memory bid tid vars i
    v ← Maybe.to-result (Buffer.get (Memory.global memory) i) "invalid access to global memory"
    Done (memory , v)

  ... | SAdd i e = do
    (memory , e) ← eval-expr memory bid tid vars e
    (memory , i) ← eval-expr memory bid tid vars i

    old ← Maybe.to-result (Buffer.get (Memory.shared memory) i) "invalid access to shared memory"
    shared ← Maybe.to-result (Buffer.set (Memory.shared memory) i (old + e)) "invalid access to shared memory"

    Done (record memory {shared = shared}, old)

  ... | GAdd i e = do
    (memory , e) ← eval-expr memory bid tid vars e
    (memory , i) ← eval-expr memory bid tid vars i

    old ← Maybe.to-result (Buffer.get (Memory.global memory) i) "invalid access to global memory"
    global ← Maybe.to-result (Buffer.set (Memory.global memory) i (old + e)) "invalid access to global memory"

    Done (record memory {global = global}, old)

  ... | SExc i e = do
    (memory , e) ← eval-expr memory bid tid vars e
    (memory , i) ← eval-expr memory bid tid vars i

    old ← Maybe.to-result (Buffer.get (Memory.shared memory) i) "invalid access to shared memory"
    shared ← Maybe.to-result (Buffer.set (Memory.shared memory) i e) "invalid access to shared memory"

    Done (record memory {shared = shared}, old)

  ... | GExc i e = do
    (memory , e) ← eval-expr memory bid tid vars e
    (memory , i) ← eval-expr memory bid tid vars i

    old ← Maybe.to-result (Buffer.get (Memory.global memory) i) "invalid access to global memory"
    global ← Maybe.to-result (Buffer.set (Memory.global memory) i e) "invalid access to global memory"

    Done (record memory {global = global}, old)

