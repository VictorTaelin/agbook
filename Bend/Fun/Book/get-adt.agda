module Bend.Fun.Book.get-adt where

open import Bend.Fun.Book.Book
open import Bend.Fun.Adt.Adt
open import Base.String.String
open import Base.String.hash
open import Base.Maybe.Maybe
open import Base.BinMap.get as Map

-- Retrieves an ADT definition from a Book by its name.
-- - book: The Book to search in.
-- - name: The name of the ADT to retrieve.
-- = Some adt if an ADT with the given name is found in the Book,
--   None if no such ADT exists.
get-adt : Book -> String -> Maybe Adt
get-adt (MkBook _ adts _) name = Map.get adts (hash name)

