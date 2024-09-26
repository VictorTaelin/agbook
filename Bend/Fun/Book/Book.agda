module Bend.Fun.Book.Book where

open import Base.BitMap.BitMap
open import Bend.Fun.Term.Term

private
  import Bend.Fun.FnDef.FnDef as FnDef'
  open module FnDef = FnDef' Term

-- The representation of a Bend program as a collection of top-level definitions.
record Book : Set where
  constructor MkBook
  field
    defs : BitMap FnDef -- Map of function definitions
