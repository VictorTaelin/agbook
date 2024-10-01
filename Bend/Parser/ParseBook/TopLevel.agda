module Bend.Parser.ParseBook.TopLevel where

open import Base.List.List
open import Base.Pair.Pair
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Term.Term using (Term)
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module FnDef = FnDef' Term

data TopLevel : Set where
  FunDef  : FnDef -> TopLevel
  TypeDef : (Pair Adt (List Ctr)) -> TopLevel
  -- ImpDef  : TopLevel
  -- HVMDef  : TopLevel
  -- Import  : TopLevel
