module Bend.Fun.Book.new where

open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term
open import Base.BitMap.new renaming (new to map-new)

private
  import Bend.Fun.FnDef.FnDef as FnDef'
  open module FnDef = FnDef' Term

-- Creates a new empty Book.
-- = An empty Book with no function definitions.
new : Book
new = MkBook map-new
