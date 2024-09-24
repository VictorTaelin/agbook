module Bend.Fun.Book.add-fn-def where

open import Bend.Fun.Book.Type
open import Bend.Fun.Term.Type
open import Base.BitMap.set
open import Base.String.hash

private
  import Bend.Fun.FnDef.Type as FnDef'
  open module FnDef = FnDef' Term

-- Adds a new function definition to the Book.
-- If a function with the same name already exists, it will be replaced.
-- - book: The Book to add the function definition to.
-- - fn-def: The function definition to add.
-- = A new Book with the added function definition.
add-fn-def : Book -> FnDef -> Book
add-fn-def (MkBook defs) fn-def =
  MkBook (set defs (hash (FnDef.name fn-def)) fn-def)
