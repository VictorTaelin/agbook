module Bend.Fun.Term.show where

open import Bend.Fun.Term.Type
open import Bend.Fun.Num.Type renaming (Num to Num')
open import Bend.Fun.FanKind.Type
open import Data.String.Type
open import Data.String.append
open import Data.String.join
open import Data.Pair.Type
open import Data.Nat.Type
open import Data.List.Type renaming (List to List')
open import Data.List.map
open import Data.List.zip
open import Data.Maybe.Type
open import Data.Trait.Show public
open import Data.Nat.show
open import Bend.Fun.show-bind
open import Bend.Fun.Op.show
open import Bend.Fun.Num.show
open import Bend.Fun.Pattern.show
import Bend.Fun.FnDef.Type as FnDef'
import Bend.Fun.FnDef.show as FDShow'
import Bend.Fun.MatchRule.show as MRShow'

instance
    ShowTerm : Show Term

private
  open module FnDef = FnDef' Term
  open module FDShow = FDShow' ShowTerm
  open module MRShow = MRShow' ShowTerm

instance
  {-# TERMINATING #-}
  ShowTerm = record { to-string = show-term }
    where mutual
      show-with : List' (Maybe String) → List' Term → String
      show-with [] [] = ""
      show-with with-bnd with-arg =
        "with " ++ join ", " (map show-bind-arg (zip with-bnd with-arg)) ++ " "
        where
          show-bind-arg : Pair (Maybe String) Term → String
          show-bind-arg (bnd , arg) = show-bind bnd ++ " = " ++ show arg

      
      show-term-app : Term → String
      show-term-app (App fun arg) = show-term-app fun ++ " " ++ show arg
      show-term-app term = show-term term

      show-term : Term → String
      show-term (Lam pat bod) = "λ" ++ show pat ++ " " ++ show bod
      show-term (Var nam) = nam
      show-term (Link nam) = "$" ++ nam
      show-term (Let pat val nxt) = "let " ++ show pat ++ " = " ++ show val ++ "; " ++ show nxt
      show-term (With typ bod) = "with " ++ typ ++ " { " ++ show bod ++ " }"
      show-term (Ask pat val nxt) = "ask " ++ show pat ++ " = " ++ show val ++ "; " ++ show nxt
      show-term (Use nam val nxt) = "use " ++ show-bind nam ++ " = " ++ show val ++ "; " ++ show nxt
      show-term (App fun arg) = "(" ++ show-term-app (App fun arg) ++ ")"
      show-term (Fan FanKind.Tup els) = "(" ++ join ", " (map show els) ++ ")"
      show-term (Fan FanKind.Dup els) = "{" ++ join " " (map show els) ++ "}"
      show-term (Num val) = show val
      show-term (Str val) = "\"" ++ val ++ "\""
      show-term (List els) = "[" ++ join ", " (map show els) ++ "]"
      show-term (Oper opr fst snd) = "(" ++ show fst ++ " " ++ show opr ++ " " ++ show snd ++ ")"
      show-term (Mat bnd arg with-bnd with-arg arms) = 
        "match " ++ show-bind bnd ++ " = " ++ show arg ++ " " ++
        show-with with-bnd with-arg ++ "{ " ++ join "; " (map show arms) ++ " }"
      show-term (Swt bnd arg with-bnd with-arg pred arms) = 
        "switch " ++ show-bind bnd ++ " = " ++ show arg ++ " " ++
        show-with with-bnd with-arg ++ "{ " ++ show-switch-arms 0 pred arms ++ " }"
        where
          show-switch-arms : Nat → Maybe String → List' Term → String
          show-switch-arms n pred [] = ""  -- Unreachable
          show-switch-arms n pred (arm :: []) = "_ " ++ show-bind pred ++ ": " ++ show arm
          show-switch-arms n pred (arm :: arms) = show n ++ ": " ++ show arm ++ "; " ++
            show-switch-arms (Succ n) pred arms
      show-term (Fold bnd arg with-bnd with-arg arms) = 
        "fold " ++ show-bind bnd ++ " = " ++ show arg ++ " " ++
        show-with with-bnd with-arg ++
        "{ " ++ join "; " (map show arms) ++ " }"
      show-term (Bend bnd arg cond step base) = 
        "bend " ++ join ", " (map show-bind-init (zip bnd arg)) ++ " { " ++
        "when " ++ show cond ++ ": " ++ show step ++ "; " ++
        "else: " ++ show base ++ " }"
        where
          show-bind-init : Pair (Maybe String) Term → String
          show-bind-init (fst , snd) = show-bind fst ++ " = " ++ show snd
      show-term (Open typ var bod) = "open " ++ typ ++ " " ++ var ++ "; " ++ show bod
      show-term (Ref nam) = nam
      show-term (Def def nxt) = "def " ++ show def ++ "\n" ++ show nxt
      show-term Era = "*"
