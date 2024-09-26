module Bend.Parser.ParseBook.ParseBook where

open import Base.BitMap.BitMap
open import Bend.Fun.Term.Term using (Term)
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module FnDef = FnDef' Term

record ParseBook : Set where
  constructor MkParseBook
  field
    fun-defs : BitMap FnDef
