module Bend.Fun.Term.map-child-binds where

open import Bend.Fun.Term.Term
open import Base.List.List renaming (List to List')
open import Base.List.append
open import Base.List.concat-maybes
open import Base.List.map
open import Base.List.reverse
open import Base.List.split-at
open import Base.List.zip
open import Base.Pair.Pair
open import Base.String.String
open import Base.Maybe.Maybe
open import Bend.Fun.Pattern.map-binds
import Base.Maybe.to-list as Maybe
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Applies a function to all immediate child bindings of a given term, passing the bound names and the children they bind to.
-- - f: The function to apply to each binding, taking the current binding and the list of terms it binds to.
-- - term: The term whose child bindings we want to map over.
-- = A new term with the function applied to all immediate child bindings.
map-child-binds : (Maybe String → List' Term → Maybe String) → Term → Term

-- No binds
map-child-binds f (Var nam)          = Var nam
map-child-binds f (Link nam)         = Link nam
map-child-binds f (With typ bod)     = With typ bod
map-child-binds f (App fun arg)      = App fun arg
map-child-binds f (Fan kind els)     = Fan kind els
map-child-binds f (Num val)          = Num val
map-child-binds f (Str val)          = Str val
map-child-binds f (List els)         = List els
map-child-binds f (Oper op fst snd)  = Oper op fst snd
map-child-binds f (Open typ var bod) = Open typ var bod
map-child-binds f (Ref nam)          = Ref nam
map-child-binds f (Def def nxt)      = Def def nxt
map-child-binds f Era                = Era

-- Simple binds
map-child-binds f (Lam pat bod)      = Lam (map-binds (λ x → f x (bod :: [])) pat) bod
map-child-binds f (Let pat val nxt)  = Let (map-binds (λ x → f x (nxt :: [])) pat) val nxt
map-child-binds f (Ask pat val nxt)  = Ask (map-binds (λ x → f x (nxt :: [])) pat) val nxt
map-child-binds f (Use nam val nxt)  = Use (f nam (nxt :: [])) val nxt

-- Binds to multiple children
map-child-binds f (Mat bnd arg with-bnd with-arg arms) =
  Mat (f bnd (map MatchRule.bod arms))
      arg
      (map (λ b -> f b (map MatchRule.bod arms)) with-bnd)
      with-arg
      (map (λ rule → record rule {
        bnd = (map (λ b → f b (MatchRule.bod rule :: [])) (MatchRule.bnd rule))
      }) arms)

map-child-binds f (Swt bnd arg with-bnd with-arg pred arms) =
  Swt (f bnd arms)
      arg
      (map (λ b -> f b arms) with-bnd)
      with-arg
      pred
      arms

map-child-binds f (Fold bnd arg with-bnd with-arg arms) =
  Fold (f bnd (map MatchRule.bod arms))
      arg
      (map (λ b -> f b (map MatchRule.bod arms)) with-bnd)
      with-arg
      (map (λ rule → record rule {
        bnd = map (λ b → f b (MatchRule.bod rule :: [])) (MatchRule.bnd rule)
      }) arms)

map-child-binds f (Bend bnd arg cond step base) =
  Bend (map (λ b -> f b (cond :: step :: base :: [])) bnd)
      arg
      cond
      step
      base
