module Bend.Transform.resolve-refs where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.not
open import Base.Bool.and
open import Base.List.List
open import Base.List.foldr
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.String.String
open import Base.String.hash
open import Base.BinMap.BinMap
open import Base.BinMap.contains
open import Base.BinMap.set
open import Base.Pair.Pair
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.contains-def
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.map-children-with-binds
open import Bend.Fun.Pattern.Pattern
import Base.BinTree.fold as BinTree
import Base.BinMap.new as BinMap
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

private
  -- Adds a list of names to the scope
  -- - scope: The current scope
  -- - names: The list of names to add
  -- = A new scope with the added names
  add-bnd : BinMap String → List String → BinMap String
  add-bnd scope names = foldr (λ name acc → set acc (hash name) name) scope names

-- Resolves references in a Term
-- - book: The Book containing all definitions
-- - scope: The current scope
-- - term: The Term to resolve references in
-- = A new Term with resolved references
resolve-refs-term : Book → BinMap String → Term → Term
resolve-refs-term book scope (Var nam) = do
  if (not (contains scope (hash nam))) && (contains-def book nam)
    then Ref nam
    else Var nam
resolve-refs-term book scope term = do
  let map-child binds child = resolve-refs-term book (add-bnd scope binds) child
  map-children-with-binds map-child term

-- Resolves references in an entire Book
-- - book: The Book to resolve references in
-- = A new Book with resolved references
resolve-refs : Book → Book
resolve-refs book =
  let map-defs val lft rgt = (Node (case val of λ where
      (Some def) → Some (record def {
        rules = (map
          (λ rule → record rule { body = resolve-refs-term book BinMap.new (Rule.body rule) })
          (FnDef.rules def)) })
      None → None) lft rgt) in

  record book {
    defs = BinTree.fold map-defs Leaf (Book.defs book)
  }
