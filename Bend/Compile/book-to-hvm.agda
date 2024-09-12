module Bend.Compile.book-to-hvm where

open import Data.List.Type
open import Data.Pair.Type
open import Data.Result.Type
open import Data.Result.bind
open import Data.String.Type
open import Bend.Fun.Book.Type renaming (Book to BBook)
open import Bend.Compile.BendToNet.book-to-nets
open import Bend.Compile.NetToHvm.nets-to-hvm
open import HVM2.Net.Type renaming (Net to HNet)

book-to-hvm : BBook → Result (List (Pair String HNet)) String
book-to-hvm book = do
  nets ← book-to-nets book
  nets-to-hvm nets
