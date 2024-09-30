module Bend.Transform.FloatCombinators.map-float-children where

open import Base.List.List
open import Base.List.map
open import Base.Pair.Pair
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Transform.FloatCombinators.Ctx
import Bend.Fun.MatchRule.MatchRule as MatchRule'

private
  open module MatchRule = MatchRule' Term

  map-list : ∀{S : Set} -> (Term -> S -> Pair Term S) -> List Term -> S -> Pair (List Term) S
  map-list f [] st        = do
    ([] , st)
  map-list f (x :: xs) st = do
    let (x , st)  = f x st
    let (xs , st) = map-list f xs st
    (x :: xs , st)

  map-match : ∀{S : Set} -> (Term -> S -> Pair Term S) -> List MatchRule -> S -> Pair (List MatchRule) S
  map-match f [] st = do
    ([] , st)
  map-match f ((MkMatchRule nam bnd bod) :: xs) st = do
    let (bod , st) = f bod st
    let (xs , st)  = map-match f xs st
    ((MkMatchRule nam bnd bod) :: xs , st)

map-float-children : ∀{S : Set} -> (Term -> S -> Pair Term S) -> Term -> S -> Pair Term S

-- Consider the entire chain of applications, so that we don't fragment it too much.
map-float-children f (App fun@(App _ _) arg) st = do
  let (fun , st) = map-float-children f fun st
  let (arg , st) = f arg st
  (App fun arg , st)
map-float-children f (App fun arg) st = do
  let (fun , st) = f fun st
  let (arg , st) = f arg st
  (App fun arg , st)

map-float-children f (Mat bnd arg with-bnd with-arg arms) st = do
  let (arg , st)      = f arg st
  let (with-arg , st) = map-list f with-arg st
  let (arms , st)     = map-match f arms st
  (Mat bnd arg with-bnd with-arg arms , st)

map-float-children f (Swt bnd arg with-bnd with-arg pred arms) st = do
  let (arg , st)      = f arg st
  let (with-arg , st) = map-list f with-arg st
  let (arms , st)     = map-list f arms st
  (Swt bnd arg with-bnd with-arg pred arms , st)

map-float-children f (Fan kind els) st = do
  let (els , st) = map-list f els st
  (Fan kind els , st)

map-float-children f (List' els) st = do
  let (els , st) = map-list f els st
  (List' els , st)

map-float-children f (Use nam val nxt) st = do
  let (val , st) = f val st
  let (nxt , st) = f nxt st
  (Use nam val nxt , st)

map-float-children f (Let pat val nxt) st = do
  let (val , st) = f val st
  let (nxt , st) = f nxt st
  (Let pat val nxt , st)

map-float-children f (Oper opr fst snd) st = do
  let (fst , st) = f fst st
  let (snd , st) = f snd st
  (Oper opr fst snd , st)

map-float-children f (Lam pat bod) st = do
  let (bod , st) = f bod st
  (Lam pat bod , st)

-- These cases should have been removed by now.
-- We can still handle them, but if they occur, it will mess up the calculation of term size.
map-float-children f (Fold bnd arg with-bnd with-arg arms) st = do
  let (arg , st)      = f arg st
  let (with-arg , st) = map-list f with-arg st
  let (arms , st)     = map-match f arms st
  (Mat bnd arg with-bnd with-arg arms , st)

map-float-children f (Bend bnd arg cond step base) st = do
  let (arg , st)  = map-list f arg st
  let (cond , st) = f cond st
  let (step , st) = f step st
  let (base , st) = f base st
  (Bend bnd arg cond step base , st)

map-float-children f (Ask pat val nxt) st = do
  let (val , st) = f val st
  let (nxt , st) = f nxt st
  (Ask pat val nxt , st)

map-float-children f (Open typ var bod) st = do
  let (bod , st) = f bod st
  (Open typ var bod , st)

-- These two should have been removed, but disappear during desugar.
-- Therefore, we handle them by deferring to their children.
map-float-children f (With typ bod) st = do
  let (bod , st) = map-float-children f bod st
  (With typ bod , st)

map-float-children f (Def def nxt) st = do
  let (nxt , st) = map-float-children f nxt st
  (Def def nxt , st)

-- The remaining cases are terminals.
map-float-children f (Var nam) st = do
  (Var nam , st)
map-float-children f (Link nam) st = do
  (Link nam , st)
map-float-children f Era st = do
  (Era , st)
map-float-children f (Num val) st = do
  (Num val , st)
map-float-children f (Str val) st = do
  (Str val , st)
map-float-children f (Ref nam) st = do
  (Ref nam , st)
