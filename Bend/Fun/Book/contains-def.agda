module Bend.Fun.Book.contains-def where

open import Bend.Fun.Book.Type
open import Base.String.Type
open import Base.String.hash
open import Base.Bool.Type
open import Base.BitMap.contains as BitMap

-- Checks if a Book contains a function definition with the given name.
-- - book: The Book to check.
-- - name: The name of the function to look for.
-- = True if the Book contains a function definition with the given name, False otherwise.
contains-def : Book → String → Bool
contains-def (MkBook defs) name = BitMap.contains defs (hash name)
