module Bend.Fun.Book.get-ctr where

open import Bend.Fun.Book.Book
open import Bend.Fun.Adt.Ctr
open import Base.String.String
open import Base.String.hash
open import Base.Maybe.Maybe
open import Base.BitMap.get as Map

-- Retrieves a constructor definition from a Book by its name.
-- - book: The Book to search in.
-- - name: The name of the constructor to retrieve.
-- = Some ctr if a constructor with the given name is found in the Book,
--   None if no such constructor exists.
get-ctr : Book -> String -> Maybe Ctr
get-ctr (MkBook _ _ ctrs) name = Map.get ctrs (hash name)
