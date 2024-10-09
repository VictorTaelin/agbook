module Bend.Transform.FloatCombinators.float-combinators where

open import Base.BinMap.BinMap
open import Base.BinMap.difference
open import Base.BinMap.empty
open import Base.BinMap.set
open import Base.BinMap.union
open import Base.BinMap.from-list
open import Base.BinMap.to-list
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.and
open import Base.Bool.not
open import Base.Bool.or
open import Base.List.List
open import Base.List.is-nil
open import Base.List.length
open import Base.List.map
open import Base.List.sum
open import Base.List.unzip
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.gt
open import Base.Nat.mul
open import Base.Nat.show
open import Base.Nat.sub
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
open import Base.String.hash
open import Bend.Fun.Book.Book
open import Bend.Fun.FnDef.new-gen
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.children
open import Bend.Fun.Term.is-ref
open import Bend.Fun.Term.free-vars
open import Bend.Fun.Term.unscoped-vars
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Pattern.binds
open import Bend.Transform.FloatCombinators.Ctx
open import Bend.Transform.FloatCombinators.is-safe
open import Bend.Transform.FloatCombinators.map-float-children
import Base.List.append as List
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'
import Bend.Fun.MatchRule.MatchRule as MatchRule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term
  open module MatchRule = MatchRule' Term

  has-unscoped-diff : Term -> Bool
  has-unscoped-diff term = do
    let (decls , uses) = unscoped-vars term
    let decls = map (λ x -> hash x , x) decls
    let uses  = map (λ x -> hash x , x) uses
    let diff1 = to-list (difference (from-list uses) (from-list decls))
    let diff2 = to-list (difference (from-list decls) (from-list uses))
    not (is-nil diff1) || not (is-nil diff2)

  is-combinator : Term -> Bool
  is-combinator term = (is-nil (free-vars term)) &&
                        (not (has-unscoped-diff term)) &&
                        (not (is-ref term))

  -- Creates a new function from the given term.
  -- The new function is added to the context.
  -- = Returns a term referencing the new function and the updated context.
  float : Ctx -> Bool -> Term -> Pair Term Ctx
  float ctx safe term = do
    let nam = (FnDef.name (Ctx.def ctx)) ++ "__C" ++ show (Ctx.name-gen ctx)
    let ctx = record ctx { name-gen = Succ (Ctx.name-gen ctx) }
    let def = new-gen nam (MkRule [] term :: []) (FnDef.src (Ctx.def ctx)) True
    let ctx = record ctx { combinators = set (Ctx.combinators ctx) (hash nam) (safe , def) }
    (Ref nam , ctx)

  pattern-size : Pattern -> Nat
  pattern-size (Fan _ pats) = ((length pats) - 1) + (sum (map pattern-size pats))
  pattern-size (Var _) = 0
  pattern-size (Chn _) = 0
  pattern-size _       = 0  -- Should be unreachable

  term-size : Term -> Nat
  term-size term = sum (map term-size (children term)) + base-size term
    where
      base-size : Term -> Nat
      base-size (Let pat _ _)        = pattern-size pat
      base-size (Fan _ els)          = (length els) - 1
      base-size (Mat _ _ _ _ arms)   = length arms
      base-size (Swt _ _ _ _ _ arms) = 2 * ((length arms) - 1)
      base-size (Lam _ _)            = 1
      base-size (App _ _)            = 1
      base-size (Oper _ _ _)         = 1
      base-size _                    = 0

float-term-child : Bool -> Term -> Pair Ctx Nat -> Pair Term (Pair Ctx Nat)
float-term-child par-comb child (ctx , par-size) = do
  let child-safe = is-safe ctx [] child
  let child-size = term-size child
  let child-comb = is-combinator child
  let too-large  = if par-comb
                  then par-size > (Ctx.max-size ctx)
                  else (Ctx.def-size ctx) > (Ctx.max-size ctx)
  if child-comb && (child-size > 0) && ((not child-safe) || too-large)
    then (do
      let ctx = record ctx { def-size = (Ctx.def-size ctx) - child-size }
      let par-size = par-size - child-size
      let (child , ctx) = float ctx child-safe child
      (child , (ctx , par-size)))
    else do
      (child , (ctx , par-size))

float-term : Term -> Ctx -> Pair Term Ctx
float-term term ctx = do
  -- Float from the bottom up
  let (term , ctx) = map-float-children float-term term ctx
  let par-size = term-size term
  let par-comb = is-combinator term
  let (term , (ctx , _)) = map-float-children (float-term-child par-comb) term (ctx , par-size)
  (term , ctx)

float-combinators : Book -> Nat -> Book
float-combinators book max-size = do
  -- TODO: Don't float the entrypoint function
  let (keys , defs) = unzip (to-list (Book.defs book))
  let (defs , combinators) = float-combinators-defs defs ([] , empty)
  let defs = map (λ def -> (hash (FnDef.name def) , def)) (List.append combinators defs)
  record book { defs = from-list defs }

  where
  float-combinators-defs : List FnDef -> Pair (List FnDef) (BinMap (Pair Bool FnDef))
    -> Pair (List FnDef) (List FnDef)

  float-combinators-defs [] (acc-defs , acc-combs) = do
    let acc-combs = map (λ x -> snd (snd x)) (to-list acc-combs)
    (acc-defs , acc-combs)

  float-combinators-defs (def@(MkFnDef def-name _ _ (rule :: _) _) :: defs) (acc-defs , acc-combs) = do
    let ctx = init-ctx book def max-size acc-combs
    let (bod , ctx) = float-term (Rule.body rule) ctx
    let def = record def { rules = MkRule (Rule.pats rule) bod :: [] }
    float-combinators-defs defs (def :: acc-defs , Ctx.combinators ctx)

  -- By this point, there shouldn't be any functions with multiple rules.
  -- We replace the function with an Era to indicate the error.
  float-combinators-defs (def :: defs) (acc-defs , acc-combs) = do
    let def = record def { rules = MkRule [] Era :: [] }
    float-combinators-defs defs (def :: acc-defs , acc-combs)

