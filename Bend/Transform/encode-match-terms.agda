module Bend.Transform.encode-match-terms where

open import Base.BinMap.from-list
open import Base.BinMap.to-list
open import Base.Bool.if
open import Base.Function.case
open import Base.List.List
open import Base.List.enumerate
open import Base.List.foldr
open import Base.List.is-nil
open import Base.List.map
open import Base.List.mmap
open import Base.List.unsnoc
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.Nat.eq
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.Trait.Monad
open import Base.Unit.Unit
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.foldr-lam
open import Bend.Fun.Term.foldl-app
open import Bend.Fun.Term.mmap-children
open import Bend.Run.AdtEncoding
import Bend.Fun.Pattern.Pattern as Pat
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module MatchRule = MatchRule' Term
  open module Rule = Rule' Term

encode-match-terms : AdtEncoding → Book → Result Book String
encode-match-terms encoding book = do
  let defs = to-list (Book.defs book)
  defs <- mmap (λ (key , def) -> do
    rules <- mmap (λ (MkRule pats body) -> do
      body <- encode-term encoding body
      Done (MkRule pats body)) (FnDef.rules def)
    Done (key , record def { rules = rules })) defs
  Done (record book { defs = from-list defs })

  where

  make-num-scott-swt : List Term → Result Term String
  make-num-scott-swt []            = Fail "No match arms"
  make-num-scott-swt (arm :: [])   = Done (Lam (Pat.Var None) arm)
  make-num-scott-swt (arm :: arms) = do
    let bod = (Swt None (Var "%tag") [] [] None (arm :: arms))
    Done (Lam (Pat.Var (Some "%tag")) bod)

  encode-match : AdtEncoding → Term → List MatchRule → Result Term String
  encode-match Scott arg arms = do
    let arms = map (λ (MkMatchRule _ bnd bod) → foldr-lam bod bnd) arms
    Done (foldl-app arg arms)
  encode-match NumScott arg arms = do
    let arms  = map (λ (MkMatchRule _ bnd bod) → foldr-lam bod bnd) arms
    match <- case arms of λ where
      -- If only one arm, we need to add an Era to the end of the tag matching switch
      (arm :: []) → do
        let bod = Swt None (Var "%tag") [] [] None (arm :: Era :: [])
        Done (Lam (Pat.Var (Some "%tag")) bod)
      _ → do
        make-num-scott-swt arms
    Done (App arg match)

  -- Convert into a sequence of native switches, decrementing by 1 each switch.
  -- `switch n {0: A; 1: B; _ n-2   : (C n-2)}`
  -- is converted to
  -- `switch n {0: A; _: λ%x match %x {0: B; _: λn-2 (C n-2)}}`
  encode-switch : Term → Maybe String → List Term → Result Term String
  encode-switch arg pred arms = do
    let (nums , succ) = unsnoc arms
    succ <- to-result succ "Switch with only 1 arms"
    let succ = Lam (Pat.Var pred) succ
    let body = foldr (λ (i , arm) acc → do
                let arms = arm :: acc :: []
                if i == 0
                  then (Swt None arg [] [] None arms)
                  else (Lam (Pat.Var (Some "%x")) (Swt None (Var "%x") [] [] None arms))
              ) succ (enumerate nums)
    Done body

  encode-term : AdtEncoding → Term → Result Term String
  encode-term encoding term = do
    term <- mmap-children (encode-term encoding) term
    case term of λ where
      (Mat bnd arg with-bnd with-arg arms) → do
        if is-nil with-bnd then Done unit else Fail "with-bnd not empty"
        if is-nil with-arg then Done unit else Fail "with-arg not empty"
        encode-match encoding arg arms
      (Swt bnd arg with-bnd with-arg pred arms) → do
        if is-nil with-bnd then Done unit else Fail "with-bnd not empty"
        if is-nil with-arg then Done unit else Fail "with-arg not empty"
        encode-switch arg pred arms
      _ → Done term
