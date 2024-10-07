module Bend.Transform.linearize-match-with where

open import Base.Function.case
open import Base.List.List
open import Base.List.map
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.foldl-app
open import Bend.Fun.Term.foldr-lam
open import Bend.Fun.Term.map-children
import Base.BitMap.map as BitMap
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module MatchRule = MatchRule' Term
  open module Rule = Rule' Term

-- Linearizes all variables specified in the `with` clauses of match terms.
linearize-match-with : Book → Book
linearize-match-with book = record book { defs = BitMap.map linearize-def (Book.defs book) }

  where

  -- Linearizes with clauses in a term
  linearize-term : Term → Term
  linearize-term term = do
    let term = map-children linearize-term term
    case term of λ where
      (Mat bnd arg with-bnd with-arg arms) → do
        let arms = map (λ arm → record arm { bod = foldr-lam (MatchRule.bod arm) with-bnd }) arms
        let term = Mat bnd arg [] [] arms
        foldl-app term with-arg
      (Swt bnd arg with-bnd with-arg pred arms) → do
        let arms = map (λ arm → foldr-lam arm with-bnd) arms
        let term = Swt bnd arg [] [] pred arms
        foldl-app term with-arg
      _ → do
        term

  -- Linearizes with clauses in a rule
  linearize-rule : Rule → Rule
  linearize-rule rule = record rule { body = linearize-term (Rule.body rule) }

  linearize-def : FnDef → FnDef
  linearize-def def = record def { rules = map linearize-rule (FnDef.rules def) }
