module Bend.Fun.Book.Type where

open import Data.Map.Type
open import Bend.Fun.Term.Type

private
  import Bend.Fun.FnDef.Type as FnDef'
  open module FnDef = FnDef' Term

record Book : Set where
  constructor MkBook
  field
    defs : Map FnDef