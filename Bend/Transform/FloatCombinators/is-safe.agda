module Bend.Transform.FloatCombinators.is-safe where

open import Base.BinMap.get
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.if
open import Base.Function.case
open import Base.List.List
open import Base.List.all-true
open import Base.List.append
open import Base.List.concat-map
open import Base.List.contains
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Eq
open import Base.String.hash
open import Bend.Fun.Book.Book
open import Bend.Fun.Pattern.binds
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Transform.FloatCombinators.Ctx
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

mutual
  -- A term can be considered safe if it is:
  -- - A Number or an Eraser.
  -- - A Tuple or Superposition where all elements are safe.
  -- - An application or numeric operation where all arguments are safe.
  -- - A safe Lambda, e.g. a nullary constructor or a lambda with safe body.
  -- - A Reference with a safe body.
  --
  -- A reference to a recursive definition (or mutually recursive) is not safe.
  is-safe : Ctx -> List String -> Term -> Bool
  is-safe ctx seen (Num _)          = True
  is-safe ctx seen Era              = True
  is-safe ctx seen (Fan _ els)      = all-true (is-safe ctx seen) els
  is-safe ctx seen (App fun arg)    = (is-safe ctx seen fun) && (is-safe ctx seen arg)
  is-safe ctx seen (Oper _ fst snd) = (is-safe ctx seen fst) && (is-safe ctx seen snd)
  is-safe ctx seen (Lam _ bod)      = is-safe-lambda ctx seen [] bod
  is-safe ctx seen (Ref nam)        = do
    -- TODO: Constructors are safe
    if (contains nam seen)
      then False  -- A recursive function, not safe
      else do
        let seen = nam :: seen
        let def  = get (Book.defs (Ctx.book ctx)) (hash nam)
        let comb = get (Ctx.combinators ctx) (hash nam)
        case (def , comb) of λ where
          (Some def , _)                 -> is-safe-def ctx seen def
          (None     , (Some (True , _))) -> True  -- A previously floated, safe combinator
          (_        , _)                 -> False
  -- TODO: This is overly conservative.
  --       Variables can be safe depending on how they're used.
  --       For example, in a well-typed numop they're safe.
  is-safe ctx _ _                   = False

  -- A sequence of lambdas is safe if the body of the last lambda is safe.
  -- If the body is a reference, it's not in active position, so it's safe.
  -- If it's a variable bound in the lambdas, it's a nullary constructor, so it's safe.
  is-safe-lambda : Ctx -> List String -> List String -> Term -> Bool
  is-safe-lambda ctx seen bnd (Lam pat bod) = is-safe-lambda ctx seen ((binds pat) ++ bnd) bod
  is-safe-lambda ctx seen bnd (Var nam)     = (contains nam bnd)  -- Nullary-constructor
  is-safe-lambda ctx seen bnd (Ref _)       = True                -- Reference to preexisting definition
  is-safe-lambda ctx seen bnd term          = is-safe ctx seen term

  is-safe-def : Ctx -> List String -> FnDef -> Bool
  is-safe-def ctx seen (MkFnDef _ _ _ []           _) = True   -- Invalid, but technically safe
  is-safe-def ctx seen (MkFnDef _ _ _ (rule :: []) _) = do
    let bnd = concat-map binds (Rule.pats rule)
    is-safe-lambda ctx seen bnd (Rule.body rule)
  is-safe-def ctx seen (MkFnDef _ _ _ (_ :: _)     _) = False  -- More than one rule == match, not safe
