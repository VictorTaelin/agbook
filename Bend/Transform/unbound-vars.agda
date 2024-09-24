module Bend.Transform.unbound-vars where

open import Base.Function.case
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Bool.and
open import Base.List.Type
open import Base.List.any-true
open import Base.List.map
open import Base.List.reverse
open import Base.List.find
open import Base.List.mfoldl
open import Base.List.foldr
open import Base.List.concat
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Nat.Trait.Eq
open import Base.Pair.Type
open import Base.String.Type
open import Base.String.Trait.Eq
open import Base.String.hash
open import Base.String.append
open import Base.BitMap.Type
open import Base.Pair.Type
open import Base.Result.Type
open import Base.Result.Trait.Monad
open import Base.Trait.Monad
open import Base.Trait.Eq
open import Base.Unit.Type
open import Bend.Fun.Book.Type
open import Bend.Fun.Term.Type renaming (List to List')
open import Bend.Fun.Term.children-with-binds
open import Bend.Fun.Pattern.Type
import Base.Maybe.to-bool as Maybe
import Base.BitMap.new as BitMap
import Base.BitMap.values as BitMap
import Base.BitMap.set as BitMap
import Base.BitMap.get as BitMap
import Base.List.append as List
import Bend.Fun.Pattern.binds as Pat
import Bend.Fun.Pattern.unscoped-binds as Pat
import Bend.Fun.FnDef.Type as FnDef'
import Bend.Fun.Rule.Type as Rule'
import Bend.Fun.MatchRule.Type as MatchRule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term
  open module MatchRule = MatchRule' Term

private
  -- Adds a list of names to the scope
  add-bnd : List String -> List String -> List String
  add-bnd scope names = List.append names scope

  -- Checks if a name is in the scope
  scope-contains : String -> List String -> Bool
  scope-contains nam scope = Maybe.to-bool (find (λ x -> x == nam) scope)

  Globals : Set
  Globals = BitMap (Pair String (Pair Nat Nat))

  use-global : Globals -> String -> Globals
  use-global global nam =
    case (BitMap.get global (hash nam)) of λ where
      (Some (_ , bnd , use)) -> BitMap.set global (hash nam) (nam , bnd , use + 1)
      None                   -> BitMap.set global (hash nam) (nam , 0 , 1)

  bnd-global : Globals -> List String -> Globals
  bnd-global global (nam :: nams) = do
    let global = case (BitMap.get global (hash nam)) of λ where
      (Some (_ , bnd , use)) -> BitMap.set global (hash nam) (nam , bnd + 1 , use)
      None                   -> BitMap.set global (hash nam) (nam , 1 , 0)
    bnd-global global nams
  bnd-global global [] = global

-- Checks for unbound variables in a term
unbound-vars-term : Term -> List String -> Globals -> Result Globals String

unbound-vars-term (Var nam) scope global =
  if (scope-contains nam scope)
  then Done global
  else Fail ("Unbound variable '" ++ nam ++ "'")

unbound-vars-term (Link nam) scope global = do
  Done (use-global global nam)

unbound-vars-term term scope global = do
  let global = case term of λ where
    (Lam pat _)   -> bnd-global global (Pat.unscoped-binds pat)
    (Let pat _ _) -> bnd-global global (Pat.unscoped-binds pat)
    _             -> global
  mfoldl (λ global (bnd , child) ->
    unbound-vars-term child (List.append bnd scope) global)
    global (children-with-binds term)

-- Checks for unbound variables in a function definition
unbound-vars-def : FnDef -> Result Unit String
unbound-vars-def def = do
  global ← mfoldl (λ global rule -> do
                    let scope = concat (map Pat.binds (Rule.pats rule))
                    global ← unbound-vars-term (Rule.body rule) scope global
                    Done global)
                  BitMap.new (FnDef.rules def)
  let errs = foldr (λ { (var , (declared , used)) acc ->
                      case (declared , used) of λ where
                        (1 , 1) -> acc
                        (0 , _) -> ("Unbound unscoped variable '" ++ var ++ "'") :: acc
                        (_ , 0) -> ("Unscoped variable '" ++ var ++ "' is never used") :: acc
                        (_ , _) -> ("Unscoped variable '" ++ var ++ "' is declared or used more than once") :: acc })
                    [] (BitMap.values global)
  case errs of λ where
    [] -> Done unit
    (err :: _) -> Fail err

-- Checks for unbound variables in an entire Book
unbound-vars : Book -> Result Unit String
unbound-vars book =
  mfoldl (λ _ def -> unbound-vars-def def)
          unit
          (BitMap.values (Book.defs book))
