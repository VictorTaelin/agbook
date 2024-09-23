module Imp.Expr.show where

open import Imp.Expr.Type
open import Base.String.Type
open import Base.String.append
open import Base.Show.Trait
import Base.Nat.show as Nat
import Base.U64.show as U64

-- Converts an Imp Expression to its string representation.
instance
  ShowExpr : Show Expr

  ShowExpr = record { to-string = to-string } where
    to-string : Expr → String

    to-string (Var v) = v
    to-string (Num n) = show n

    to-string Tid = "thread_id()"
    to-string Bid = "block_id()"

    to-string (Add a b) = (to-string a) ++  " + " ++ (to-string b)
    to-string (Sub a b) = (to-string a) ++  " - " ++ (to-string b)
    to-string (Mul a b) = (to-string a) ++  " * " ++ (to-string b)
    to-string (Div a b) = (to-string a) ++  " / " ++ (to-string b)
    to-string (Mod a b) = (to-string a) ++  " % " ++ (to-string b)
    to-string (And a b) = (to-string a) ++ " && " ++ (to-string b)
    to-string (Or  a b) = (to-string a) ++ " || " ++ (to-string b)
    to-string (Not a)   = "~" ++ (to-string a)

    to-string (Eq  a b) = (to-string a) ++ " == " ++ (to-string b)
    to-string (Neq a b) = (to-string a) ++ " != " ++ (to-string b)
    to-string (Lt  a b) = (to-string a) ++  " < " ++ (to-string b)
    to-string (Le  a b) = (to-string a) ++ " <= " ++ (to-string b)
    to-string (Gt  a b) = (to-string a) ++  " > " ++ (to-string b)
    to-string (Ge  a b) = (to-string a) ++ " >= " ++ (to-string b)

    to-string (Cond e a b) = (to-string e) ++ " ? " ++ (to-string a) ++ " : " ++ (to-string b)

    to-string (SGet e) = "atomic_get(shared[" ++ (to-string e) ++ "])"
    to-string (GGet e) = "atomic_get(global[" ++ (to-string e) ++ "])"

    to-string (SAdd v i) = "atomic_add(shared[" ++ (to-string v) ++ "], " ++ (to-string i) ++ ")"
    to-string (GAdd v i) = "atomic_add(global[" ++ (to-string v) ++ "], " ++ (to-string i) ++ ")"
    to-string (SExc v e) = "atomic_exc(shared[" ++ (to-string v) ++ "], " ++ (to-string e) ++ ")"
    to-string (GExc v e) = "atomic_exc(shared[" ++ (to-string v) ++ "], " ++ (to-string e) ++ ")"
