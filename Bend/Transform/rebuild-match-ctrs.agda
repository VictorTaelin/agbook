module Bend.Transform.rebuild-match-ctrs where

open import Base.BinMap.BinMap
open import Base.BinMap.to-list
open import Base.BinMap.from-list
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Function.case
open import Base.Function.id
open import Base.List.List
open import Base.List.enumerate
open import Base.List.length
open import Base.List.map
open import Base.List.mmap
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.sub
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.String.append
open import Base.Trait.Monad
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.get-ctr
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Adt.CtrField
open import Bend.Fun.Num.Num
open import Bend.Fun.Op.Op
open import Bend.Fun.Term.Term renaming (List to List' ; Num to Num')
open import Bend.Fun.Term.add-num
open import Bend.Fun.Term.foldl-app
open import Bend.Fun.Term.mmap-children
open import Bend.Fun.Term.var-or-era
import Base.Maybe.fold as Maybe
import Bend.Fun.FanKind.FanKind as FanKind
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term
  open module MatchRule = MatchRule' Term

  rebuild-match-arm : Book → Maybe String → MatchRule → Result MatchRule String
  rebuild-match-arm book bnd (MkMatchRule nam bnds body) = do
    nam ← to-result nam "Match with no constructor"
    let bod = Use bnd (foldl-app (Ref nam) (map var-or-era bnds)) body
    Done (MkMatchRule (Some nam) bnds bod)

  rebuild-switch-arm : Maybe String → String → Nat → Pair Nat Term → Term
  rebuild-switch-arm bnd pred last-arm (idx , bod) = do
    if idx == last-arm
      then (Use bnd (add-num (Var pred) last-arm) bod)
      else (Use bnd (Num' (U24 idx)) bod)

  rebuild-term : Book → Term → Result Term String
  rebuild-term book term = do
    term ← mmap-children (rebuild-term book) term
    case term of λ where
      (Mat bnd arg with-bnd with-arg arms) → do
        arms ← mmap (rebuild-match-arm book bnd) arms
        Done (Mat bnd arg with-bnd with-arg arms)
      (Swt bnd arg with-bnd with-arg pred arms) → do
        pred ← to-result pred "Switch with no pred"
        let last-arm = (length arms) - 1
        let rebuilt-arms = map (rebuild-switch-arm bnd pred last-arm) (enumerate arms)
        Done (Swt bnd arg with-bnd with-arg (Some pred) rebuilt-arms)
      _ → Done term

  rebuild-rule : Book → Rule → Result Rule String
  rebuild-rule book (MkRule pats bod) = do
    bod ← rebuild-term book bod
    Done (MkRule pats bod)

  rebuild-def : Book → FnDef → Result FnDef String
  rebuild-def book (MkFnDef name typ check rules src) = do
    rules ← mmap (rebuild-rule book) rules
    Done (MkFnDef name typ check rules src)

-- Rebuilds match and switch terms to include 'Use' terms in their arms.
rebuild-match-ctrs : Book → Result Book String
rebuild-match-ctrs book = do
  defs ← mmap (λ (key , def) → do
                  def ← rebuild-def book def
                  Done (key , def))
                (to-list (Book.defs book))
  Done (record book { defs = from-list defs })
