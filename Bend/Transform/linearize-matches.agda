module Bend.Transform.linearize-matches where

open import Base.Bool.Bool
open import Base.Bool.not
open import Base.Function.case
open import Base.Function.id
open import Base.List.List
open import Base.List.append
open import Base.List.contains
open import Base.List.concat-map
open import Base.List.concat-maybes
open import Base.List.dedup
open import Base.List.difference
open import Base.List.filter
open import Base.List.map
open import Base.List.unsnoc
open import Base.List.unzip
open import Base.List.zip
open import Base.Maybe.Maybe
open import Base.Maybe.fold
open import Base.Maybe.to-list
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Eq
open import Base.String.Trait.Ord
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.free-vars
open import Bend.Fun.Term.foldr-lam
open import Bend.Fun.Term.map-children
open import Bend.Transform.subst
import Base.BitMap.map as BitMap
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module MatchRule = MatchRule' Term
  open module Rule = Rule' Term

-- Linearizes all variables used in a matches' arms.
linearize-matches : Book → Book
linearize-matches book = record book { defs = BitMap.map linearize-def (Book.defs book) }

  where

  update-with : List (Maybe String) → List Term → List String → Pair (List (Maybe String)) (List Term)
  update-with with-bnd with-arg free-vars = do
    let no-free = λ (bnd , arg) → not (contains (fold "" id bnd) free-vars)
    unzip (filter no-free (zip with-bnd with-arg))

  -- Lifts free variables in match arms to lambdas
  lift-match-vars : List (Maybe String) → List Term → List (Pair (List String) Term)
                    → (Pair (List (Maybe String)) (Pair (List Term) (List Term)))
  lift-match-vars with-bnd with-arg arms = do
    let free-vars = concat-map (λ (bnd , arm) → difference (free-vars arm) bnd) arms
    let free-vars = dedup free-vars
    let (with-bnd , with-arg) = update-with with-bnd with-arg free-vars
    let free-vars = map Some free-vars
    let arms = map (λ (_ , arm) → foldr-lam arm free-vars) arms
    (with-bnd , with-arg , arms)

  -- Linearizes matches in a term
  linearize-term : Term → Term
  linearize-term term = do
    let term = map-children linearize-term term
    case term of λ where
      (Mat bnd arg with-bnd with-arg arms) → do
        let arms' = map (λ (MkMatchRule nam bnds bod) → (concat-maybes bnds , bod)) arms
        let (with-bnd , with-arg , bods) = lift-match-vars with-bnd with-arg arms'
        let arms  = map (λ (bod , arm) → record arm { bod = bod }) (zip bods arms)
        Mat bnd arg with-bnd with-arg arms
      (Swt bnd arg with-bnd with-arg pred arms) → do
        let (nums , succ) = unsnoc arms
        let succ  = fold Era id succ  -- succ should never be None here
        let arms' = (map (λ arm → [] , arm) nums) ++ ((to-list pred , succ) :: [])
        let (with-bnd , with-arg , bods) = lift-match-vars with-bnd with-arg arms'
        Swt bnd arg with-bnd with-arg pred bods
      _ → do
        term

  -- Linearizes matches in a rule
  linearize-rule : Rule → Rule
  linearize-rule rule = record rule { body = linearize-term (Rule.body rule) }

  linearize-def : FnDef → FnDef
  linearize-def def = record def { rules = map linearize-rule (FnDef.rules def) }
