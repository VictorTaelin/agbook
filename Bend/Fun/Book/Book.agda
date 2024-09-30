module Bend.Fun.Book.Book where

open import Base.BitMap.BitMap
open import Bend.Fun.Term.Term
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr

private
  import Bend.Fun.FnDef.FnDef as FnDef'
  open module FnDef = FnDef' Term

-- The representation of a Bend program as a collection of top-level definitions.
record Book : Set where
  constructor MkBook
  field
    defs : BitMap FnDef -- Map of function definitions
    adts : BitMap Adt   -- Map of ADTs
    ctrs : BitMap Ctr   -- Map of constructors
