module Bend.Transform.resolve-refs where

open import Base.Function.case
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Bool.not
open import Base.Bool.and
open import Base.List.Type
open import Base.List.foldr
open import Base.List.head
open import Base.List.map
open import Base.List.split-at
open import Base.List.reverse
open import Base.Maybe.Type
open import Base.Maybe.maybe
open import Base.String.Type
open import Base.String.hash
open import Base.Map.Type
open import Base.Map.contains
open import Base.Map.set
open import Base.Pair.Type
open import Bend.Fun.Book.Type
open import Bend.Fun.Term.Type renaming (List to List')
open import Bend.Fun.Pattern.Type
import Bend.Fun.Pattern.binds as Pat
import Base.Tree.fold as Tree
import Base.Map.new as Map
import Bend.Fun.FnDef.Type as FnDef'
import Bend.Fun.Rule.Type as Rule'
import Bend.Fun.MatchRule.Type as MatchRule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term
  open module MatchRule = MatchRule' Term

private
  -- Adds a list of names to the scope
  -- - scope: The current scope
  -- - names: The list of names to add
  -- = A new scope with the added names
  add-bnd : Map String → List String → Map String
  add-bnd scope names = foldr (λ name acc → set acc (hash name) name) scope names

-- Resolves references in a Term
-- - book: The Book containing all definitions
-- - scope: The current scope
-- - term: The Term to resolve references in
-- = A new Term with resolved references
resolve-refs-term : Book → Map String → Term → Term
resolve-refs-term book scope (Var name) = do
  let key = hash name
  if (not (contains scope key)) && (contains (Book.defs book) key)
    then Ref name
    else Var name
resolve-refs-term book scope (Lam pat body) = do
  let new-scope = add-bnd scope (Pat.binds pat)
  Lam pat (resolve-refs-term book new-scope body)
resolve-refs-term book scope (Let pat val nxt) =
  let new-scope = add-bnd scope (Pat.binds pat)
  in Let pat (resolve-refs-term book scope val) (resolve-refs-term book new-scope nxt)
resolve-refs-term book scope (App fun arg) = App (resolve-refs-term book scope fun) (resolve-refs-term book scope arg)
resolve-refs-term book scope (Fan kind terms) = Fan kind (map (resolve-refs-term book scope) terms)
resolve-refs-term book scope (List' terms) = List' (map (resolve-refs-term book scope) terms)
resolve-refs-term book scope (Oper op t1 t2) = Oper op (resolve-refs-term book scope t1) (resolve-refs-term book scope t2)
resolve-refs-term book scope (Mat bnd arg with-bnd with-arg arms) = do
  let new-scope = add-bnd scope (maybe [] (λ x → x :: []) bnd)
  let new-scope = foldr (λ mb acc → add-bnd acc (maybe [] (λ x → x :: []) mb)) new-scope with-bnd
  -- TODO: Each arm should add the names bound in the elimination to their scope.
  -- See https://github.com/HigherOrderCO/Bend/issues/718
  Mat bnd (resolve-refs-term book scope arg)
    with-bnd (map (resolve-refs-term book scope) with-arg)
    (map (λ rule → record rule { body = resolve-refs-term book new-scope (MatchRule.body rule) }) arms)
resolve-refs-term book scope (Swt bnd arg with-bnd with-arg pred arms) = do
  let scope-nums = add-bnd scope (maybe [] (λ x → x :: []) bnd)
  let scope-pred = add-bnd scope-nums (maybe [] (λ x → x :: []) pred)
  let (nums , pred') = split-at 1 (reverse arms)
  let nums = map (resolve-refs-term book scope-nums) nums
  let pred' = resolve-refs-term book scope-pred (maybe Era (λ x → x) (head pred'))
  Swt bnd (resolve-refs-term book scope arg)
    with-bnd (map (resolve-refs-term book scope) with-arg)
    pred (reverse (pred' :: nums))
resolve-refs-term book scope (Fold bnd arg with-bnd with-arg arms) = do
  let new-scope = add-bnd scope (maybe [] (λ x → x :: []) bnd)
  let new-scope = foldr (λ mb acc → add-bnd acc (maybe [] (λ x → x :: []) mb)) new-scope with-bnd
  Fold bnd (resolve-refs-term book scope arg)
    with-bnd (map (resolve-refs-term book scope) with-arg)
    (map (λ rule → record rule { body = resolve-refs-term book new-scope (MatchRule.body rule) }) arms)
resolve-refs-term book scope (Bend bnd arg cond step base) = do
  let new-scope = foldr (λ mb acc → add-bnd acc (maybe [] (λ x → x :: []) mb)) scope bnd
  Bend bnd (map (resolve-refs-term book scope) arg)
        (resolve-refs-term book new-scope cond)
        (resolve-refs-term book new-scope step)
        (resolve-refs-term book new-scope base)
resolve-refs-term book scope (Open typ var body) =
  -- TODO: put the variables from the constructor in scope
  Open typ var (resolve-refs-term book scope body)
resolve-refs-term book scope (Def def nxt) =
  Def (record def { rules = map (λ rule → record rule { body = resolve-refs-term book scope (Rule.body rule) }) (FnDef.rules def) })
      (resolve-refs-term book scope nxt)
resolve-refs-term book scope term = term

-- Resolves references in an entire Book
-- - book: The Book to resolve references in
-- = A new Book with resolved references
resolve-refs : Book → Book
resolve-refs book =
  let map-defs val lft rgt = (Node (case val of λ where
      (Some def) → Some (record def {
        rules = (map 
          (λ rule → record rule { body = resolve-refs-term book Map.new (Rule.body rule) }) 
          (FnDef.rules def)) })
      None → None) lft rgt) in

  record book {
    defs = Tree.fold map-defs Leaf (Book.defs book)
  }
