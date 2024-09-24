module Bend.Fun.Term.map-children-with-binds where

open import Bend.Fun.Term.Type
open import Base.List.Type renaming (List to List')
open import Base.List.append
open import Base.List.concat-maybes
open import Base.List.map
open import Base.List.reverse
open import Base.List.split-at
open import Base.List.zip
open import Base.Pair.Type
open import Base.String.Type
open import Base.Maybe.Type
open import Bend.Fun.Pattern.binds
import Base.Maybe.to-list as Maybe
import Bend.Fun.MatchRule.Type as MatchRule'
import Bend.Fun.FnDef.Type as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Applies a function to all immediate child terms of a given term, passing the bound names.
-- - f: The function to apply to each child term, taking bound names and the term.
-- - term: The term whose children we want to map over.
-- = A new term with the function applied to all immediate children.
map-children-with-binds : (List' String → Term → Term) → Term → Term
map-children-with-binds f (Lam pat bod)      = Lam pat (f (binds pat) bod)
map-children-with-binds f (Var nam)          = Var nam
map-children-with-binds f (Link nam)         = Link nam
map-children-with-binds f (Let pat val nxt)  = Let pat (f [] val) (f (binds pat) nxt)
map-children-with-binds f (With typ bod)     = With typ (f [] bod)
map-children-with-binds f (Ask pat val nxt)  = Ask pat (f [] val) (f (binds pat) nxt)
map-children-with-binds f (Use nam val nxt)  = Use nam (f [] val) (f (Maybe.to-list nam) nxt)
map-children-with-binds f (App fun arg)      = App (f [] fun) (f [] arg)
map-children-with-binds f (Fan kind els)     = Fan kind (map (f []) els)
map-children-with-binds f (Num val)          = Num val
map-children-with-binds f (Str val)          = Str val
map-children-with-binds f (List els)         = List (map (f []) els)
map-children-with-binds f (Oper op fst snd)  = Oper op (f [] fst) (f [] snd)
map-children-with-binds f (Open typ var bod) = Open typ var (f [] bod)
map-children-with-binds f (Ref nam)          = Ref nam
map-children-with-binds f (Def def nxt)      = Def def (f [] nxt)
map-children-with-binds f Era                = Era

map-children-with-binds f (Mat bnd arg with-bnd with-arg arms) = do
  Mat bnd (f [] arg) with-bnd (map (λ arg -> f [] arg) with-arg)
    (map (λ rule -> record rule {
        bod = f (concat-maybes ((bnd :: []) ++ with-bnd ++ (MatchRule.bnd rule))) (MatchRule.bod rule) })
      arms)

map-children-with-binds f (Swt bnd arg with-bnd with-arg pred arms) = do
  let pred' , nums = split-at 1 (reverse arms)
  let pred' = map (λ arm -> (f (concat-maybes (bnd :: [] ++ with-bnd ++ pred :: [])) arm)) pred'
  let nums  = map (λ arm -> (f (concat-maybes (bnd :: [] ++ with-bnd)) arm)) pred'
  Swt bnd (f [] arg) with-bnd (map (λ arg -> f [] arg) with-arg) pred (reverse (pred' ++ nums))

map-children-with-binds f (Fold bnd arg with-bnd with-arg arms) = do
  Fold bnd (f [] arg) with-bnd (map (λ arg -> f [] arg) with-arg)
    (map (λ rule -> record rule {
        bod = f (concat-maybes ((bnd :: []) ++ with-bnd ++ (MatchRule.bnd rule))) (MatchRule.bod rule) })
      arms)

map-children-with-binds f (Bend bnd arg cond step base) = do
  Bend bnd (map (λ arg -> f [] arg) arg)
    (f (concat-maybes bnd) cond)
    (f (concat-maybes bnd) step)
    (f (concat-maybes bnd) base)
