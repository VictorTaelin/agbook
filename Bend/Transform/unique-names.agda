module Bend.Transform.unique-names where

open import Base.BitMap.BitMap
open import Base.BitMap.to-list
open import Base.BitMap.from-list
open import Base.Bool.Bool
open import Base.Function.case
open import Base.Function.id
open import Base.List.List
open import Base.List.concat
open import Base.List.foldl
open import Base.List.foldr
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.hash
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Pattern.Pattern
open import Bend.nat-to-name
import Base.BitMap.empty as BitMap
import Base.BitMap.get as BitMap
import Base.BitMap.set as BitMap
import Base.Maybe.fold as Maybe
import Bend.Fun.Pattern.binds as Pattern
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

  Scope : Set
  Scope = BitMap (List String)

  -- Generate a new unique name and increment the counter
  fresh : Nat -> Pair String Nat
  fresh count = (nat-to-name count , (Succ count))

  push-scope : List (Maybe String) -> Nat -> Scope -> (Pair Nat Scope)
  push-scope ((Some name) :: xs) count scope = do
    let (nam , count) = fresh count
    let nams = Maybe.fold [] id (BitMap.get scope (hash name))
    let scope = BitMap.set scope (hash name) (nam :: nams)
    push-scope xs count scope
  push-scope (None :: xs) count scope = push-scope xs count scope
  push-scope []           count scope = (count , scope)

  push-pattern : Pattern -> Nat -> Scope -> (Pair Nat Scope)
  push-pattern pat gen scope = push-scope (map Some (Pattern.binds pat)) gen scope

  pop-scope : Maybe String -> Scope -> Pair (Maybe String) Scope
  pop-scope (Some nam) scope with (BitMap.get scope (hash nam))
  ... | (Some (nam' :: nams)) = (Some nam' , BitMap.set scope (hash nam) nams)
  ... | _                     = (Some nam  , scope)  -- This case should be unreachable
  pop-scope None scope = (None , scope)

  pop-list : List (Maybe String) -> Scope -> Pair (List (Maybe String)) Scope
  pop-list bnds scope = foldr (λ bnd (bnds , scope) -> do
                                let bnd  , scope = pop-scope bnd scope
                                (bnd :: bnds , scope))
                              ([] , scope) bnds

  pop-pattern : Pattern -> Scope -> Pair Pattern Scope

  pop-pattern (Var (Some name)) scope = do
    case BitMap.get scope (hash name) of λ where
      (Some (nam :: nams)) -> (Var (Some nam) , BitMap.set scope (hash name) nams)
      _                    -> (Var (Some name) , scope)

  pop-pattern (Var None) scope = do
    (Var None , scope)

  pop-pattern (Fan kind pats) scope = do
    let (pats , scope) = foldr (λ pat (pats , sc) -> do
                                  let (pat , sc) = pop-pattern pat sc
                                  (pat :: pats , sc))
                                ([] , scope) pats
    (Fan kind pats , scope)
  pop-pattern (Ctr name pats) scope = do
    let (pats , scope) = foldr (λ pat (pats , sc) -> do
                                  let (pat , sc) = pop-pattern pat sc
                                  (pat :: pats , sc))
                                ([] , scope) pats
    (Ctr name pats , scope)
  pop-pattern (Lst pats) scope = do
    let (pats , scope) = foldr (λ pat (pats , sc) -> do
                                  let (pat , sc) = pop-pattern pat sc
                                  (pat :: pats , sc))
                                ([] , scope) pats
    (Lst pats , scope)
  pop-pattern (Chn nam) scope = do
    (Chn nam , scope)
  pop-pattern (Num num) scope = do
    (Num num , scope)
  pop-pattern (Str str) scope = do
    (Str str , scope)

  use-var : String -> Scope -> String
  use-var nam scope with (BitMap.get scope (hash nam))
  ... | (Some (nam :: ns)) = nam
  ... | _                  = nam  -- Unbound variable case.
                                  -- Don't change so that we can use it before checking for unbounds.
                                  -- Note that this may cause name conflicts.

mutual

  -- Apply unique names to a term
  unique-names-term : Nat -> Scope -> Term -> Pair Term (Pair Nat Scope)
  unique-names-term gen scope (Var nam) = do
    let nam = use-var nam scope
    (Var nam , gen , scope)

  unique-names-term gen scope (Mat bnd arg with-bnd with-arg arms) = do
    let (arg , gen , scope)      = unique-names-term gen scope arg
    let (with-arg , gen , scope) = unique-names-list gen scope with-arg
    let (gen , scope)            = push-scope (bnd :: []) gen scope
    let (gen , scope)            = push-scope with-bnd gen scope
    let (arms , gen , scope)     = unique-names-match gen scope arms
    let (with-bnd , scope)       = pop-list with-bnd scope
    let (bnd , scope)            = pop-scope bnd scope
    (Mat bnd arg with-bnd with-arg arms , gen , scope)

  unique-names-term gen scope (Fold bnd arg with-bnd with-arg arms) = do
    let (arg , gen , scope)      = unique-names-term gen scope arg
    let (with-arg , gen , scope) = unique-names-list gen scope with-arg
    let (gen , scope)            = push-scope (bnd :: []) gen scope
    let (gen , scope)            = push-scope with-bnd gen scope
    let (arms , gen , scope)     = unique-names-match gen scope arms
    let (with-bnd , scope)       = pop-list with-bnd scope
    let (bnd , scope)            = pop-scope bnd scope
    (Fold bnd arg with-bnd with-arg arms , gen , scope)

  unique-names-term gen scope (Swt bnd arg with-bnd with-arg pred arms) = do
    let (arg , gen , scope)         = unique-names-term gen scope arg
    let (with-arg , gen , scope)    = unique-names-list gen scope with-arg
    let (gen , scope)               = push-scope (bnd :: []) gen scope
    let (gen , scope)               = push-scope with-bnd gen scope
    let (pred , arms , gen , scope) = unique-names-swt gen scope pred arms
    let (with-bnd , scope)          = pop-list with-bnd scope
    let (bnd , scope)               = pop-scope bnd scope
    (Swt bnd arg with-bnd with-arg pred arms , gen , scope)

  unique-names-term gen scope (Bend bnd arg cond step base) = do
    let (arg , gen , scope)  = unique-names-list gen scope arg
    let (gen , scope)        = push-scope bnd gen scope
    let (cond , gen , scope) = unique-names-term gen scope cond
    let (step , gen , scope) = unique-names-term gen scope step
    let (base , gen , scope) = unique-names-term gen scope base
    let (bnd , scope)        = pop-list bnd scope
    (Bend bnd arg cond step base , gen , scope)

  unique-names-term gen scope (Let pat val nxt) = do
    let (val , gen , scope) = unique-names-term gen scope val
    let (gen , scope)       = push-pattern pat gen scope
    let (nxt , gen , scope) = unique-names-term gen scope nxt
    let (pat , scope)       = pop-pattern pat scope
    (Let pat val nxt , gen , scope)

  unique-names-term gen scope (Ask pat val nxt) = do
    let (val , gen , scope) = unique-names-term gen scope val
    let (gen , scope)       = push-pattern pat gen scope
    let (nxt , gen , scope) = unique-names-term gen scope nxt
    let (pat , scope)       = pop-pattern pat scope
    (Ask pat val nxt , gen , scope)

  unique-names-term gen scope (Use nam val nxt) = do
    let (val , gen , scope) = unique-names-term gen scope val
    let (gen , scope)       = push-scope (nam :: []) gen scope
    let (nxt , gen , scope) = unique-names-term gen scope nxt
    let (nam , scope)       = pop-scope nam scope
    (Use nam val nxt , gen , scope)

  unique-names-term gen scope (Lam pat bod) = do
    let (gen , scope)       = push-pattern pat gen scope
    let (bod , gen , scope) = unique-names-term gen scope bod
    let (pat , scope)       = pop-pattern pat scope
    (Lam pat bod , gen , scope)

  unique-names-term gen scope (Fan fan els) = do
    let (els , gen , scope) = unique-names-list gen scope els
    (Fan fan els , gen , scope)

  unique-names-term gen scope (List' els) = do
    let (els , gen , scope) = unique-names-list gen scope els
    (List' els , gen , scope)

  unique-names-term gen scope (App fun arg) = do
    let (fun , gen , scope) = unique-names-term gen scope fun
    let (arg , gen , scope) = unique-names-term gen scope arg
    (App fun arg , gen , scope)

  unique-names-term gen scope (Oper opr fst snd) = do
    let (fst , gen , scope) = unique-names-term gen scope fst
    let (snd , gen , scope) = unique-names-term gen scope snd
    (Oper opr fst snd , gen , scope)

  unique-names-term gen scope (With typ bod) = do
    let (bod , gen , scope) = unique-names-term gen scope bod
    (With typ bod , gen , scope)

  -- Terminal cases like numbers, era, etc.
  unique-names-term gen scope term = (term , gen , scope)

  -- Apply unique names to a list of terms
  unique-names-list : Nat -> Scope -> List Term -> Pair (List Term) (Pair Nat Scope)
  unique-names-list gen scope [] = do
    ([] , gen , scope)
  unique-names-list gen scope (t :: ts) = do
    let (t , gen , scope)  = unique-names-term gen scope t
    let (ts , gen , scope) = unique-names-list gen scope ts
    (t :: ts , gen , scope)

  -- Apply unique names to a list of match rules
  unique-names-match : Nat -> Scope -> List MatchRule -> Pair (List MatchRule) (Pair Nat Scope)
  unique-names-match gen scope []            = do
    ([] , gen , scope)
  unique-names-match gen scope (arm :: arms) = do
    let (gen , scope)        = push-scope (MatchRule.bnd arm) gen scope
    let (bod , gen , scope)  = unique-names-term gen scope (MatchRule.bod arm)
    let (bnd , scope)        = pop-list (MatchRule.bnd arm) scope
    let arm                  = record arm { bnd = bnd ; bod = bod }
    let (arms , gen , scope) = unique-names-match gen scope arms
    (arm :: arms , gen , scope)

  unique-names-swt : Nat -> Scope -> Maybe String -> List Term
    -> Pair (Maybe String) (Pair (List Term) (Pair Nat Scope))

  unique-names-swt gen scope pred []        = do
    (pred , [] , gen , scope)   -- This case should be unreachable

  unique-names-swt gen scope pred (x :: []) = do
    let (gen , scope)     = push-scope (pred :: []) gen scope
    let (x , gen , scope) = unique-names-term gen scope x
    let (pred , scope)    = pop-scope pred scope
    (pred , x :: [] , gen , scope)

  unique-names-swt gen scope pred (x :: xs) = do
    let (x , gen , scope)         = unique-names-term gen scope x
    let (pred , xs , gen , scope) = unique-names-swt gen scope pred xs
    (pred , x :: xs , gen , scope)

-- Apply unique names to a Book
unique-names : Book -> Book
unique-names (MkBook defs) = do
  let defs = foldr (λ (key , def) defs -> do
                      let def = record def { rules = unique-names-rules 0 (FnDef.rules def) }
                      (key , def) :: defs)
                    [] (to-list defs)
  MkBook (from-list defs)

  where

  unique-names-rules : Nat -> List Rule -> List Rule
  unique-names-rules gen []                       = []
  unique-names-rules gen (MkRule pats bod :: rules) = do
    let scope               = BitMap.empty
    let (gen , scope)       = push-scope (map Some (concat (map Pattern.binds pats))) gen scope
    let (bod , gen , scope) = unique-names-term gen scope bod
    let (pats , scope)      = foldr (λ pat (pats , scope) -> do
                                      let (pat , scope) = pop-pattern pat scope
                                      (pat :: pats , scope))
                                    ([] , scope) pats
    let rules               = unique-names-rules gen rules
    (MkRule pats bod :: rules)
