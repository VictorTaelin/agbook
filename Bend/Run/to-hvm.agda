module Bend.Run.to-hvm where

open import Base.List.List
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.String.String
open import Bend.Compile.book-to-hvm
import Bend.Fun.Book.Book as Bend
import HVM2.Net.Net as HVM2

-- Compiles a Bend Book in core form to HVM and applies all the
-- inet-level transformations.
to-hvm : Bend.Book -> Result (List (Pair String HVM2.Net)) String
to-hvm book = do
  book-to-hvm book
