module Bend.Fun.FnDef.Type (Term : Set) where

open import Data.Bool.Type
open import Data.List.Type
open import Data.String.Type
open import Bend.Source.Type
open import Bend.Fun.Type.Type

private
  import Bend.Fun.Rule.Type as Rule'
  open module Rule = Rule' Term

-- Function definition
record FnDef : Set where
  constructor MkFnDef
  field
    name  : String     -- The name of the function
    type  : Type       -- The type of the function
    check : Bool       -- Whether to type-check this function
    rules : List Rule  -- The list of rules defining the function
    src   : Source     -- Source information for the function definition
