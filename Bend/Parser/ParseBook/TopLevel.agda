module Bend.Parser.ParseBook.TopLevel where

open import Bend.Fun.Term.Type
import Bend.Fun.FnDef.Type as FnDef'

private
  open module FnDef = FnDef' Term

data TopLevel : Set where
  FunDef : FnDef → TopLevel
  -- TypeDef : TopLevel
  -- ImpDef  : TopLevel
  -- HVMDef  : TopLevel
  -- Import  : TopLevel
