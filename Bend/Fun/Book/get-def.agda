module Bend.Fun.Book.get-def where

open import Base.BinMap.get
open import Base.Maybe.to-result
open import Base.Result.Result
open import Base.String.String
open import Base.String.hash
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module FnDef = FnDef' Term

-- Retrieves a function definition from a Book by its name.
-- - book: The Book to search in.
-- - name: The name of the function to retrieve.
-- = Some fnDef if a function with the given name is found in the Book,
--   None if no such function exists.
get-def : Book → String → Result FnDef String
get-def (MkBook defs _ _) name = to-result (get defs (hash name)) "Def not found"
