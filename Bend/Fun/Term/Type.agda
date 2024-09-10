module Bend.Fun.Term.Type where

open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.String.Type
open import Bend.Fun.FanKind.Type
open import Bend.Fun.Pattern.Type
open import Bend.Fun.Op.Type
open import Bend.Fun.Source.Type

open import Data.List.Type renaming (List to List')
open import Bend.Fun.Num.Type renaming (Num to Num')

-- Forward declare to import the parameterised modules
data Term : Set

private
  import Bend.Fun.MatchRule.Type as MR
  open module MatchRule = MR Term

  import Bend.Fun.FnDef.Type as FD
  open module FnDef = FD Term

data Term where
  Lam  : Pattern → Term → Term
  Var  : String → Term
  Link : String → Term
  Let  : Pattern → Term → Term → Term
  With : String → Term → Term
  Ask  : Pattern → Term → Term → Term
  Use  : Maybe String → Term → Term → Term
  App  : Term → Term → Term
  Fan  : FanKind → List' Term → Term
  Num  : Num' → Term
  Str  : String → Term
  List : List' Term → Term
  Oper : Op → Term → Term → Term
  Mat  : Maybe String → Term → List' (Maybe String) → List' Term → List' MatchRule → Term
  Swt  : Maybe String → Term → List' (Maybe String) → List' Term → Maybe String → List' Term → Term
  Fold : Maybe String → Term → List' (Maybe String) → List' Term → List' MatchRule → Term
  Bend : List' (Maybe String) → List' Term → Term → Term → Term → Term
  Open : String → String → Term → Term
  Ref  : String → Term
  Def  : FnDef → Term → Term
  Era  : Term
