module Bend.Fun.FnDef.Type (Term : Set) where

open import Data.Bool.Type
open import Data.List.Type
open import Data.String.Type
open import Bend.Fun.Source.Type
open import Bend.Fun.Type.Type

private
  import Bend.Fun.Rule.Type as Rule'
  open module Rule = Rule' Term

record FnDef : Set where
  constructor MkFnDef
  field
    name  : String
    type  : Type
    check : Bool
    rules : List Rule
    src   : Source
