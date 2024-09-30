open import Bend.Fun.Term.Term using (Term)
open import Base.Trait.Show

module Bend.Fun.FnDef.show (TShow : Show Term) where

open import Bend.Fun.Type.show
open import Bend.Fun.Pattern.show
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import Base.List.List
open import Base.List.map
open import Base.List.is-nil
open import Base.Bool.if
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

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
