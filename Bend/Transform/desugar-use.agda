module Bend.Transform.desugar-use where

open import Base.Function.case
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.String.String
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.map-children
open import Bend.Transform.subst
import Base.BinMap.map as BinMap
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

-- Desugar use expressions in a Book
desugar-use : Book → Book
desugar-use book = record book { defs = BinMap.map desugar-def (Book.defs book) }

  where

  desugar-term : Term → Term
  desugar-term term = do
    let term = map-children desugar-term term
    case term of λ where
      (Use (Some nam) val nxt) → subst nam val nxt
      (Use None val nxt)       → nxt
      _                        → term

  -- Desugar use expressions in a rule
  desugar-rule : Rule → Rule
  desugar-rule rule = record rule { body = desugar-term (Rule.body rule) }

  -- Desugar use expressions in a function definition
  desugar-def : FnDef → FnDef
  desugar-def def = record def { rules = map desugar-rule (FnDef.rules def) }
