open import Bend.Fun.Term.Type using (Term)
open import Data.Trait.Show

module Bend.Fun.FnDef.show (TShow : Show Term) where

open import Bend.Fun.Type.show
open import Bend.Fun.Pattern.show
open import Data.String.Type
open import Data.String.append
open import Data.String.join
open import Data.List.Type
open import Data.List.map
open import Data.List.is-nil
open import Data.Bool.if
import Bend.Fun.FnDef.Type as FnDef'
import Bend.Fun.Rule.Type as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

instance
  ShowFnDef : Show FnDef
  ShowFnDef = record { to-string = show-fn-def }
    where
      show-rule : String → Rule → String
      show-rule fname (MkRule pats body) =
        "(" ++ fname ++ (if is-nil pats then "" else " " ++ join " " (map show pats)) ++ ")" ++ " = " ++ show {{TShow}} body
        
      show-fn-def : FnDef → String
      show-fn-def (MkFnDef name type check rules src) =
        (if check then "" else "unchecked ") ++ name ++ " : " ++ show type ++ "\n" ++
        join "\n" (map (show-rule name) rules)
