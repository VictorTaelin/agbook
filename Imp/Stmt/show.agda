module Imp.Stmt.show where

open import Imp.Stmt.Type
open import Imp.Expr.show
open import Base.Nat.Type
open import Base.Show.Trait
open import Base.Nat.add
open import Base.Nat.show
open import Base.String.Type
open import Base.String.append
open import Base.String.join

-- Converts an Imp Expression to its string representation.
instance
  ShowStmt : Show Stmt

  ShowStmt = record { to-string = to-string 0 } where
    indent : Nat → String
    indent Zero     = ""
    indent (Succ n) = "  " ++ (indent n)

    -- Converts an Imp Expression to its string representation at a given indent level.
    to-string : Nat → Stmt → String

    to-string i (Locals vs) = (indent i) ++ "local " ++ (join ", " vs)

    to-string i (LSet v e) = (indent i) ++ v ++ " = " ++ (show e)

    to-string i (SSet n e) = (indent i) ++ "atomic_set(shared[" ++ (show n) ++ "], " ++ (show e) ++ ")"
    to-string i (GSet n e) = (indent i) ++ "atomic_set(global[" ++ (show n) ++ "], " ++ (show e) ++ ")"

    to-string i (If e a b) =
      (indent i) ++ "if (" ++ (show e) ++ ") {\n" ++
        (to-string (i + 1) a) ++ "\n" ++
      (indent i) ++ "} else {\n" ++
        (to-string (i + 1) b) ++ "\n" ++
      (indent i) ++ "}"

    to-string i (While e b) =
      (indent i) ++ "while (" ++ (show e) ++ ") {\n" ++
        (to-string (i + 1) b) ++ "\n" ++
      (indent i) ++ "}"

    to-string i (Ret e) =
      (indent i) ++ "return " ++ (show e)

    to-string i (Cont)  = (indent i) ++ "continue"
    to-string i (Break) = (indent i) ++ "break"

    to-string i (Ignore e) = (indent i) ++ (show e)

    to-string i (Then a b) = (to-string i a) ++ "\n" ++ (to-string i b)

    to-string i (Call v b) =
      (indent i) ++ v ++ " = ({\n" ++
        (to-string (i + 1) b) ++ "\n" ++
      (indent i) ++ "})"
