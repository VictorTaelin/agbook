module Bend.Fun.Book.show where

open import Bend.Fun.Book.Type
open import Bend.Fun.Term.Type
open import Bend.Fun.Term.show
open import Data.Pair.Type
open import Data.String.Type
open import Data.String.append
open import Data.String.join
open import Data.String.lte
open import Data.List.Type
open import Data.List.map
open import Data.List.sort
open import Data.Map.to-list
open import Data.Trait.Show public
import Bend.Fun.FnDef.Type as FnDef'
import Bend.Fun.FnDef.show as FDShow'

private
  open module FnDef = FnDef' Term
  open module FDShow = FDShow' ShowTerm

instance
  ShowBook : Show Book
  ShowBook = record { to-string = show-book }
    where
      show-book : Book → String
      show-book (MkBook defs) = 
        let def-list = map Pair.snd (to-list defs)
            sorted-defs = sort (λ x y → FnDef.name x <= FnDef.name y) def-list
        in join "\n\n" (map show sorted-defs)
