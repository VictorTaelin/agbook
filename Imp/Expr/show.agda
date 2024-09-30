module Imp.Expr.show where

open import Base.Nat.show renaming (show to show-nat)
open import Base.String.append
open import Base.String.String
open import Base.U64.show renaming (show to show-u64)
open import Imp.Expr.Expr

-- Converts an Imp Expression to its string representation.
show : Expr → String

show (Var v) = v
show (Num n) = show-u64 n

show Tid = "thread_id()"
show Bid = "block_id()"

show (Add a b) = (show a) ++  " + " ++ (show b)
show (Sub a b) = (show a) ++  " - " ++ (show b)
show (Mul a b) = (show a) ++  " * " ++ (show b)
show (Div a b) = (show a) ++  " / " ++ (show b)
show (Mod a b) = (show a) ++  " % " ++ (show b)
show (And a b) = (show a) ++ " && " ++ (show b)
show (Or  a b) = (show a) ++ " || " ++ (show b)
show (Not a)   = "~" ++ (show a)

show (Eq  a b) = (show a) ++ " == " ++ (show b)
show (Neq a b) = (show a) ++ " != " ++ (show b)
show (Lt  a b) = (show a) ++  " < " ++ (show b)
show (Le  a b) = (show a) ++ " <= " ++ (show b)
show (Gt  a b) = (show a) ++  " > " ++ (show b)
show (Ge  a b) = (show a) ++ " >= " ++ (show b)

show (Cond e a b) = (show e) ++ " ? " ++ (show a) ++ " : " ++ (show b)

show (SGet e) = "atomic_get(shared[" ++ (show e) ++ "])"
show (GGet e) = "atomic_get(global[" ++ (show e) ++ "])"

show (SAdd v i) = "atomic_add(shared[" ++ (show v) ++ "], " ++ (show i) ++ ")"
show (GAdd v i) = "atomic_add(global[" ++ (show v) ++ "], " ++ (show i) ++ ")"
show (SExc v e) = "atomic_exc(shared[" ++ (show v) ++ "], " ++ (show e) ++ ")"
show (GExc v e) = "atomic_exc(shared[" ++ (show v) ++ "], " ++ (show e) ++ ")"
