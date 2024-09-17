-- Provides functions to display Imp expressions and statements at
-- a specific indentation level. These are used for the Show implementations
-- of each of the types.

module Imp.Show.indented where

import Imp.Expr.Type as Expr'
import Data.Nat.show as Nat
import Data.U64.Type as U64
open import Imp.Stmt.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.String.Type
open import Data.String.append
open import Data.String.join

private
  open module Expr = Expr' Stmt

  -- indent by two spaces
  indent : Nat → String
  indent Zero     = ""
  indent (Succ n) = "  " ++ (indent n)

interleaved mutual
  show-i-expr : Nat → Expr → String
  show-i-stmt : Nat → Stmt → String

  show-i-expr _ (Var v) = v
  show-i-expr _ (Num n) = Nat.show (U64.primWord64ToNat n)

  show-i-expr _ Tid = "thread_id()"
  show-i-expr _ Bid = "block_id()"

  show-i-expr i (Add a b) = (show-i-expr i a) ++  " + " ++ (show-i-expr i b)
  show-i-expr i (Sub a b) = (show-i-expr i a) ++  " - " ++ (show-i-expr i b)
  show-i-expr i (Mul a b) = (show-i-expr i a) ++  " * " ++ (show-i-expr i b)
  show-i-expr i (Div a b) = (show-i-expr i a) ++  " / " ++ (show-i-expr i b)
  show-i-expr i (Mod a b) = (show-i-expr i a) ++  " % " ++ (show-i-expr i b)
  show-i-expr i (And a b) = (show-i-expr i a) ++ " && " ++ (show-i-expr i b)
  show-i-expr i (Or  a b) = (show-i-expr i a) ++ " || " ++ (show-i-expr i b)
  show-i-expr i (Not a)   = "~" ++ (show-i-expr i a)

  show-i-expr i (Eq  a b) = (show-i-expr i a) ++ " == " ++ (show-i-expr i b)
  show-i-expr i (Neq a b) = (show-i-expr i a) ++ " != " ++ (show-i-expr i b)
  show-i-expr i (Lt  a b) = (show-i-expr i a) ++  " < " ++ (show-i-expr i b)
  show-i-expr i (Le  a b) = (show-i-expr i a) ++ " <= " ++ (show-i-expr i b)
  show-i-expr i (Gt  a b) = (show-i-expr i a) ++  " > " ++ (show-i-expr i b)
  show-i-expr i (Ge  a b) = (show-i-expr i a) ++ " >= " ++ (show-i-expr i b)

  show-i-expr i (Cond e a b) = (show-i-expr i e) ++ " ? " ++ (show-i-expr i a) ++ " : " ++ (show-i-expr i b)

  show-i-expr _ (SGet v) = "atomic_get(shared[" ++ (Nat.show v) ++ "])"
  show-i-expr _ (GGet v) = "atomic_get(global[" ++ (Nat.show v) ++ "])"

  show-i-expr i (SAdd v e) = "atomic_add(shared[" ++ (Nat.show v) ++ "], " ++ (show-i-expr i e) ++ ")"
  show-i-expr i (GAdd v e) = "atomic_add(global[" ++ (Nat.show v) ++ "], " ++ (show-i-expr i e) ++ ")"
  show-i-expr i (SExc v e) = "atomic_exc(shared[" ++ (Nat.show v) ++ "], " ++ (show-i-expr i e) ++ ")"
  show-i-expr i (GExc v e) = "atomic_exc(shared[" ++ (Nat.show v) ++ "], " ++ (show-i-expr i e) ++ ")"

  show-i-expr i (Call s) =
    "({\n" ++
      (show-i-stmt (i + 1) s) ++
    (indent i) ++ "\n})"

  show-i-stmt i (Locals vs) = (indent i) ++ "local " ++ (join ", " vs)

  show-i-stmt i (LSet v e) = (indent i) ++ v ++ " = " ++ (show-i-expr i e)

  show-i-stmt i (SSet n e) = (indent i) ++ "atomic_set(shared[" ++ (Nat.show n) ++ "], " ++ (show-i-expr i e) ++ ")"
  show-i-stmt i (GSet n e) = (indent i) ++ "atomic_set(global[" ++ (Nat.show n) ++ "], " ++ (show-i-expr i e) ++ ")"

  show-i-stmt i (If e a) =
    (indent i) ++ "if (" ++ (show-i-expr i e) ++ ") {\n" ++
      (show-i-stmt (i + 1) a) ++ "\n" ++
    (indent i) ++ "}"

  show-i-stmt i (ElseIf e a) =
    (indent i) ++ "else if (" ++ (show-i-expr i e) ++ " {\n" ++
      (show-i-stmt (i + 1) a) ++ "\n" ++
    (indent i) ++ "}"

  show-i-stmt i (Else a) =
    (indent i) ++ "else {\n" ++
      (show-i-stmt (i + 1) a) ++ "\n" ++
    (indent i) ++ "}"

  show-i-stmt i (While e b) =
    (indent i) ++ "while (" ++ (show-i-expr i e) ++ ") {\n" ++
      (show-i-stmt (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"

  show-i-stmt i (Ret e) =
    (indent i) ++ "return " ++ (show-i-expr i e)

  show-i-stmt i (Cont)  = (indent i) ++ "continue"
  show-i-stmt i (Break) = (indent i) ++ "break"

  show-i-stmt i (Ignore e) = (indent i) ++ (show-i-expr i e)

  show-i-stmt i (Then a b) = (show-i-stmt i a) ++ "\n" ++ (show-i-stmt i b)
