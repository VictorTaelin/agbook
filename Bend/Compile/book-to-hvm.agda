module Bend.Compile.book-to-hvm where

open import Base.List.List
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Bend.Fun.Book.Book renaming (Book to BBook)
open import Bend.Compile.BendToNet.book-to-nets
open import Bend.Compile.NetToHvm.nets-to-hvm
open import HVM2.Net.Net renaming (Net to HNet)

-- Converts a Bend Book to a list of HVM Nets.
-- This function performs the following steps:
-- 1. Converts the Bend Book to a list of Bend Nets.
-- 2. Converts the list of Bend Nets to a list of HVM Nets.
-- - book: The Bend Book to be converted.
-- = A Result containing either:
--   - A list of pairs, each consisting of:
--     - The name of the original Bend definition
--     - The converted HVM Net
--   - An error message if any step of the conversion fails
book-to-hvm : BBook -> Result (List (Pair String HNet)) String
book-to-hvm book = do
  nets <- book-to-nets book
  nets-to-hvm nets
