module Bend.Fun.Book.map-rules where

open import Base.List.map
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term
import Base.BinMap.map as BinMap
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

map-rules : (Rule → Rule) → Book → Book
map-rules f book = do
  let map-def f def = record def { rules = map f (FnDef.rules def) }
  let defs = BinMap.map (map-def f) (Book.defs book)
  record book { defs = defs }
