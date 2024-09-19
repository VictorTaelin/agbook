module Bend.Fun.Book.show where

open import Bend.Fun.Book.Type
open import Bend.Fun.Term.Type
open import Bend.Fun.Term.show
open import Base.Pair.Type
open import Base.String.Type
open import Base.String.append
open import Base.String.join
open import Base.String.Ord
open import Base.List.Type
open import Base.List.map
open import Base.List.sort
open import Base.Map.to-list
open import Base.Trait.Ord
open import Base.Trait.Show public
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
        let def-list = map snd (to-list defs)
            sorted-defs = sort (λ x y → (FnDef.name x) <= (FnDef.name y)) def-list
        in join "\n\n" (map show sorted-defs)
