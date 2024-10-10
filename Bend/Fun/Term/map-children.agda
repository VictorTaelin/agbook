module Bend.Fun.Term.map-children where

open import Bend.Fun.Term.Term
open import Base.List.List renaming (List to List')
open import Base.List.map
open import Base.Maybe.Maybe
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Applies a function to all immediate child terms of a given term.
-- - f: The function to apply to each child term.
-- - term: The term whose children we want to map over.
-- = A new term with the function applied to all immediate children.
map-children : (Term → Term) → Term → Term
map-children f (Lam pat bod) = Lam pat (f bod)
map-children f (Var nam) = Var nam
map-children f (Link nam) = Link nam
map-children f (Let pat val nxt) = Let pat (f val) (f nxt)
map-children f (With typ bod) = With typ (f bod)
map-children f (Ask pat val nxt) = Ask pat (f val) (f nxt)
map-children f (Use nam val nxt) = Use nam (f val) (f nxt)
map-children f (App fun arg) = App (f fun) (f arg)
map-children f (Fan kind els) = Fan kind (map f els)
map-children f (Num val) = Num val
map-children f (Str val) = Str val
map-children f (List els) = List (map f els)
map-children f (Oper op fst snd) = Oper op (f fst) (f snd)
map-children f (Mat bnd arg with-bnd with-arg arms) =
  Mat bnd (f arg) with-bnd (map f with-arg) (map (λ rule → record rule { bod = f (MatchRule.bod rule) }) arms)
map-children f (Swt bnd arg with-bnd with-arg pred arms) =
  Swt bnd (f arg) with-bnd (map f with-arg) pred (map f arms)
map-children f (Fold bnd arg with-bnd with-arg arms) =
  Fold bnd (f arg) with-bnd (map f with-arg) (map (λ rule → record rule { bod = f (MatchRule.bod rule) }) arms)
map-children f (Bend bnd arg cond step base) =
  Bend bnd (map f arg) (f cond) (f step) (f base)
map-children f (Open typ var bod) = Open typ var (f bod)
map-children f (Ref nam) = Ref nam
map-children f (Def def nxt) = Def def (f nxt)
map-children f Era = Era

