module Bend.Fun.Term.Type where

open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.String.Type
open import Bend.Fun.FanKind.Type
open import Bend.Fun.Pattern.Type
open import Bend.Fun.Op.Type
open import Bend.Source.Type
open import Bend.Source.TextSpan.Type
open import Data.List.Type renaming (List to List')
open import Bend.Fun.Num.Type renaming (Num to Num')
import Bend.Fun.MatchRule.Type as MatchRule'
import Bend.Fun.FnDef.Type as FnDef'

-- Forward declare to import the parameterised modules
data Term : Set

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Represents the various constructs in the language
data Term where
  Lam  : (pat : Pattern) → (bod : Term) → Term
  Var  : (nam : String) → Term
  Link : (nam : String) → Term
  Let  : (pat : Pattern) → (val : Term) → (nxt : Term) → Term
  With : (typ : String) → (bod : Term) → Term
  Ask  : (pat : Pattern) → (val : Term) → (nxt : Term) → Term
  Use  : (nam : Maybe String) → (val : Term) → (nxt : Term) → Term
  App  : (fun : Term) → (arg : Term) → Term
  Fan  : (fan : FanKind) → (els : List' Term) → Term
  Num  : (val : Num') → Term
  Str  : (val : String) → Term
  List : (els : List' Term) → Term
  Oper : (opr : Op) → (fst : Term) → (snd : Term) → Term
  Mat  : (bnd : Maybe String) → (arg : Term) → (with-bnd : List' (Maybe String)) → (with-arg : List' Term) → (arms : List' MatchRule) → Term
  Swt  : (bnd : Maybe String) → (arg : Term) → (with-bnd : List' (Maybe String)) → (with-arg : List' Term) → (pred : Maybe String) → (arms : List' Term) → Term
  Fold : (bnd : Maybe String) → (arg : Term) → (with-bnd : List' (Maybe String)) → (with-arg : List' Term) → (arms : List' MatchRule) → Term
  Bend : (bnd : List' (Maybe String)) → (arg : List' Term) → (cond : Term) → (step : Term) → (base : Term) → Term
  Open : (typ : String) → (var : String) → (bod : Term) → Term
  Ref  : (nam : String) → Term
  Def  : (def : FnDef) → (nxt : Term) → Term
  Era  : Term
