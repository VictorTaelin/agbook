module Bend.Fun.FnDef.FnDef (Term : Set) where

open import Base.Bool.Bool
open import Base.List.List
open import Base.String.String
open import Bend.Source.Source
open import Bend.Fun.Type.Type

private
  import Bend.Fun.Rule.Rule as Rule'
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

