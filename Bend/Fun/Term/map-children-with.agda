module Bend.Fun.Term.map-children-with where

open import Bend.Fun.Term.Term
open import Base.List.List renaming (List to List')
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.Pair.Pair
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

private
  map-list : ∀ {A : Set} → (A → Term → Pair A Term) → A → List' Term → Pair A (List' Term)
  map-list f state [] = (state , [])
  map-list f state (x :: xs) = do
    let (state , x)  = f state x
    let (state , xs) = map-list f state xs
    (state , x :: xs)

  map-arms : ∀ {A : Set} → (A → Term → Pair A Term) → A → List' MatchRule → Pair A (List' MatchRule)
  map-arms f state [] = (state , [])
  map-arms f state (rule :: rules) = do
    let (state , bod)   = f state (MatchRule.bod rule)
    let (state , rules) = map-arms f state rules
    (state , record rule { bod = bod } :: rules)

-- Applies a function to all immediate child terms of a given term, carrying state.
-- - f: The function to apply to each child term, which also takes and returns a state.
-- - state: The initial state.
-- - term: The term whose children we want to map over.
-- = A pair of the final state and the new term with the function applied to all immediate children.
map-children-with : ∀ {A : Set} → (A → Term → Pair A Term) → A → Term → Pair A Term
map-children-with f state (Lam pat bod) = do
  let (state , bod) = f state bod
  (state , Lam pat bod)
map-children-with f state (Var nam) = (state , Var nam)
map-children-with f state (Link nam) = (state , Link nam)
map-children-with f state (Let pat val nxt) = do
  let (state , val) = f state val
  let (state , nxt) = f state nxt
  (state , Let pat val nxt)
map-children-with f state (With typ bod) = do
  let (state , bod) = f state bod
  (state , With typ bod)
map-children-with f state (Ask pat val nxt) = do
  let (state , val) = f state val
  let (state , nxt) = f state nxt
  (state , Ask pat val nxt)
map-children-with f state (Use nam val nxt) = do
  let (state , val) = f state val
  let (state , nxt) = f state nxt
  (state , Use nam val nxt)
map-children-with f state (App fun arg) = do
  let (state , fun) = f state fun
  let (state , arg) = f state arg
  (state , App fun arg)
map-children-with f state (Fan kind els) = do
  let (state , els) = map-list f state els
  (state , Fan kind els)
map-children-with f state (Num val) = (state , Num val)
map-children-with f state (Str val) = (state , Str val)
map-children-with f state (List els) = do
  let (state , els) = map-list f state els
  (state , List els)
map-children-with f state (Oper op fst snd) = do
  let (state , fst) = f state fst
  let (state , snd) = f state snd
  (state , Oper op fst snd)
map-children-with f state (Mat bnd arg with-bnd with-arg arms) = do
  let (state , arg)      = f state arg
  let (state , with-arg) = map-list f state with-arg
  let (state , arms)     = map-arms f state arms
  (state , Mat bnd arg with-bnd with-arg arms)
map-children-with f state (Swt bnd arg with-bnd with-arg pred arms) = do
  let (state , arg)      = f state arg
  let (state , with-arg) = map-list f state with-arg
  let (state , arms)     = map-list f state arms
  (state , Swt bnd arg with-bnd with-arg pred arms)
map-children-with f state (Fold bnd arg with-bnd with-arg arms) = do
  let (state , arg)      = f state arg
  let (state , with-arg) = map-list f state with-arg
  let (state , arms)     = map-arms f state arms
  (state , Fold bnd arg with-bnd with-arg arms)
map-children-with f state (Bend bnd arg cond step base) = do
  let (state , arg)  = map-list f state arg
  let (state , cond) = f state cond
  let (state , step) = f state step
  let (state , base) = f state base
  (state , Bend bnd arg cond step base)
map-children-with f state (Open typ var bod) = do
  let (state , bod) = f state bod
  (state , Open typ var bod)
map-children-with f state (Ref nam) = do
  (state , Ref nam)
map-children-with f state (Def def nxt) = do
  let (state , nxt) = f state nxt
  (state , Def def nxt)
map-children-with f state Era = do
  (state , Era)

