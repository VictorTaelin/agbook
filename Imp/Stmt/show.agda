module Imp.Stmt.show where

open import Base.Nat.add
open import Base.Nat.show renaming (show to show-nat)
open import Base.Nat.Type
open import Base.String.append
open import Base.String.join
open import Base.String.Type
open import Imp.Expr.show renaming (show to show-expr)
open import Imp.Stmt.Type

-- Converts an Imp Expression to its string representation.
show : Stmt -> String

show = show-indent 0 where

  -- Indent 2 * n spaces
  indent : Nat -> String
  indent Zero     = ""
  indent (Succ n) = "  " ++ (indent n)

  -- Converts an Imp Expression to its string representation at a given indent level.
  show-indent : Nat -> Stmt -> String
  show-indent i (Locals vs) = (indent i) ++ "local " ++ (join ", " vs)
  show-indent i (LSet v e) = (indent i) ++ v ++ " = " ++ (show-expr e)
  show-indent i (SSet n e) = (indent i) ++ "atomic_set(shared[" ++ (show-nat n) ++ "], " ++ (show-expr e) ++ ")"
  show-indent i (GSet n e) = (indent i) ++ "atomic_set(global[" ++ (show-nat n) ++ "], " ++ (show-expr e) ++ ")"
  show-indent i (If e a b) =
    (indent i) ++ "if (" ++ (show-expr e) ++ ") {\n" ++
      (show-indent (i + 1) a) ++ "\n" ++
    (indent i) ++ "} else {\n" ++
      (show-indent (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"
  show-indent i (While e b) =
    (indent i) ++ "while (" ++ (show-expr e) ++ ") {\n" ++
      (show-indent (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"
  show-indent i (Ret e) =
    (indent i) ++ "return " ++ (show-expr e)
  show-indent i (Cont)  = (indent i) ++ "continue"
  show-indent i (Break) = (indent i) ++ "break"
  show-indent i (Ignore e) = (indent i) ++ (show-expr e)
  show-indent i (Then a b) = (show-indent i a) ++ "\n" ++ (show-indent i b)
  show-indent i (Call v b) =
    (indent i) ++ v ++ " = ({\n" ++
      (show-indent (i + 1) b) ++ "\n" ++
    (indent i) ++ "})"
