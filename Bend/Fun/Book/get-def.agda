module Bend.Fun.Book.get-def where

open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term
open import Base.String.String
open import Base.String.hash
open import Base.Maybe.Maybe
open import Base.BinMap.get as Map

private
  import Bend.Fun.FnDef.FnDef as FnDef'
  open module FnDef = FnDef' Term

-- Retrieves a function definition from a Book by its name.
-- - book: The Book to search in.
-- - name: The name of the function to retrieve.
-- = Some fnDef if a function with the given name is found in the Book,
--   None if no such function exists.
get-def : Book → String → Maybe FnDef
get-def (MkBook defs _ _) name = Map.get defs (hash name)
