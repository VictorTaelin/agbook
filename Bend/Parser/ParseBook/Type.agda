module Bend.Parser.ParseBook.Type where

open import Base.Map.Type
open import Bend.Fun.Term.Type using (Term)
import Bend.Fun.FnDef.Type as FnDef'

private
  open module FnDef = FnDef' Term

record ParseBook : Set where
  constructor MkParseBook
  field
    fun-defs : Map FnDef
