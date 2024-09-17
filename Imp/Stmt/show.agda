module Imp.Stmt.show where

import Data.Nat.show as Nat
import Imp.Expr.show as Expr

open import Imp.Stmt.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.String.Type
open import Data.String.append

private
  -- indent by two spaces
  indent : Nat → String
  indent Zero     = ""
  indent (Succ n) = "  " ++ (indent n)

-- Convert an Imp statement to a human-readable string.
show : Stmt → String
show s = show-indented 0 s where

  show-indented : Nat → Stmt → String

  show-indented i (LSet v e) = (indent i) ++ v ++ " = " ++ (Expr.show e)

  show-indented i (SSet n e) = (indent i) ++ "atomic_set(shared[" ++ (Nat.show n) ++ "], " ++ (Expr.show e) ++ ")"
  show-indented i (GSet n e) = (indent i) ++ "atomic_set(global[" ++ (Nat.show n) ++ "], " ++ (Expr.show e) ++ ")"

  show-indented i (If e a) =
    (indent i) ++ "if (" ++ (Expr.show e) ++ ") {\n" ++
      (show-indented (i + 1) a) ++ "\n" ++
    (indent i) ++ "}"

  show-indented i (ElseIf e a) =
    (indent i) ++ "else if (" ++ (Expr.show e) ++ " {\n" ++
      (show-indented (i + 1) a) ++ "\n" ++
    (indent i) ++ "}"

  show-indented i (Else a) =
    (indent i) ++ "else {\n" ++
      (show-indented (i + 1) a) ++ "\n" ++
    (indent i) ++ "}"

  show-indented i (While e b) =
    (indent i) ++ "while (" ++ (Expr.show e) ++ ") {\n" ++
      (show-indented (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"

  show-indented i (Ret e) =
    (indent i) ++ "return " ++ (Expr.show e)

  show-indented i (Cont)  = (indent i) ++ "continue"
  show-indented i (Break) = (indent i) ++ "break"

  show-indented i (Ignore e) = (indent i) ++ (Expr.show e)

  show-indented i (Then a b) = (show-indented i a) ++ "\n" ++ (show-indented i b)
