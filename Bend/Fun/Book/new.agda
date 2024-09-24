module Bend.Fun.Book.new where

open import Bend.Fun.Book.Type
open import Bend.Fun.Term.Type
open import Base.BitMap.new renaming (new to map-new)

private
  import Bend.Fun.FnDef.Type as FnDef'
  open module FnDef = FnDef' Term

-- Creates a new empty Book.
-- = An empty Book with no function definitions.
new : Book
new = MkBook map-new
