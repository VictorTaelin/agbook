module Bend.Parser.ParseBook.ParseBook where

open import Base.BitMap.BitMap
open import Bend.Fun.Term.Term using (Term)
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr
import Bend.Fun.FnDef.FnDef as FnDef'

private
  module Fun = FnDef' Term

record ParseBook : Set where
  constructor MkParseBook
  field
    fun-defs : BitMap Fun.FnDef
    adts     : BitMap Adt
    ctrs     : BitMap Ctr
