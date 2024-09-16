module Bend.Fun.Book.Type where

open import Data.Map.Type
open import Bend.Fun.Term.Type

private
  import Bend.Fun.FnDef.Type as FnDef'
  open module FnDef = FnDef' Term

-- The representation of a Bend program as a collection of top-level definitions.
record Book : Set where
  constructor MkBook
  field
    defs : Map FnDef -- Map of function definitions
