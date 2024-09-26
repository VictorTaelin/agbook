module Bend.Parser.ParseBook.TopLevel where

open import Bend.Fun.Term.Term
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module FnDef = FnDef' Term

data TopLevel : Set where
  FunDef : FnDef -> TopLevel
  -- TypeDef : TopLevel
  -- ImpDef  : TopLevel
  -- HVMDef  : TopLevel
  -- Import  : TopLevel
