module Bend.Fun.Book.get-adt-ctrs where

open import Base.Maybe.Maybe
open import Base.List.List
open import Base.List.mmap
open import Base.Maybe.Trait.Monad
open import Base.String.String
open import Base.Trait.Monad
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.get-adt
open import Bend.Fun.Book.get-ctr

-- Retrieves the constructors of an ADT from a Book by the ADT's name.
-- - book: The Book to search in.
-- - name: The name of the ADT whose constructors we want to retrieve.
-- = Some ctrs if an ADT with the given name is found in the Book,
--   where ctrs is a List of Ctr (constructors),
--   None if no such ADT exists.
get-adt-ctrs : Book → String → Maybe (List Ctr)
get-adt-ctrs book name = do
  adt ← get-adt book name
  mmap (get-ctr book) (Adt.ctr adt)
