module Imp.Expr.show where

import Data.Nat.show as Nat
import Data.U64.Type as U64
open import Imp.Expr.Type
open import Data.String.Type
open import Data.String.append

-- Convert an Imp expression to a human-readable string.
show : Expr → String
show (Var v) = v
show (Num n) = Nat.show (U64.primWord64ToNat n)

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

show (SGet v) = "atomic_get(shared[" ++ (Nat.show v) ++ "])"
show (GGet v) = "atomic_get(global[" ++ (Nat.show v) ++ "])"

show (SAdd v e) = "atomic_add(shared[" ++ (Nat.show v) ++ "], " ++ (show e) ++ ")"
show (GAdd v e) = "atomic_add(global[" ++ (Nat.show v) ++ "], " ++ (show e) ++ ")"
show (SExc v e) = "atomic_exc(shared[" ++ (Nat.show v) ++ "], " ++ (show e) ++ ")"
show (GExc v e) = "atomic_exc(shared[" ++ (Nat.show v) ++ "], " ++ (show e) ++ ")"
