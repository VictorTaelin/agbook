module Bend.Fun.Book.contains-def where

open import Bend.Fun.Book.Book
open import Base.String.String
open import Base.String.hash
open import Base.Bool.Bool
open import Base.BinMap.contains as Map

-- Checks if a Book contains a function definition with the given name.
-- - book: The Book to check.
-- - name: The name of the function to look for.
-- = True if the Book contains a function definition with the given name, False otherwise.
contains-def : Book → String → Bool
contains-def (MkBook defs _ _) name = Map.contains defs (hash name)
