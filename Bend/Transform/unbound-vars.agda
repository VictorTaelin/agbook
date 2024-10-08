module Bend.Transform.unbound-vars where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.and
open import Base.List.List
open import Base.List.any-true
open import Base.List.map
open import Base.List.reverse
open import Base.List.find
open import Base.List.mfoldl
open import Base.List.foldr
open import Base.List.concat
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.Trait.Eq
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Eq
open import Base.String.hash
open import Base.String.append
open import Base.BinMap.BinMap
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.Trait.Monad
open import Base.Trait.Eq
open import Base.Unit.Unit
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.children-with-binds
open import Bend.Fun.Pattern.Pattern
import Base.Maybe.to-bool as Maybe
import Base.BinMap.new as BinMap
import Base.BinMap.values as BinMap
import Base.BinMap.set as BinMap
import Base.BinMap.get as BinMap
import Base.List.append as List
import Bend.Fun.Pattern.binds as Pat
import Bend.Fun.Pattern.unscoped-binds as Pat
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'
import Bend.Fun.MatchRule.MatchRule as MatchRule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term
  open module MatchRule = MatchRule' Term

private
  -- Adds a list of names to the scope
  -- - scope: The current scope
  -- - names: The names to add to the scope
  -- = The updated scope with new names added
  add-bnd : List String → List String → List String
  add-bnd scope names = List.append names scope

  -- Checks if a name is in the scope
  -- - nam: The name to check
  -- - scope: The current scope
  -- = True if the name is in the scope, False otherwise
  scope-contains : String → List String → Bool
  scope-contains nam scope = Maybe.to-bool (find (λ x → x == nam) scope)

  -- Represents a map of global variables with their binding and usage information
  Globals : Set
  Globals = BinMap (Pair String (Pair Nat Nat))

  -- Updates the usage count of a global variable
  -- - global: The current global variable map
  -- - nam: The name of the variable to update
  -- = An updated global variable map with the usage count incremented
  use-global : Globals → String → Globals
  use-global global nam =
    case (BinMap.get global (hash nam)) of λ where
      (Some (_ , bnd , use)) → BinMap.set global (hash nam) (nam , bnd , use + 1)
      None                   → BinMap.set global (hash nam) (nam , 0 , 1)

  -- Updates the binding count of global variables
  -- - global: The current global variable map
  -- - nams: The list of names to update
  -- = An updated global variable map with the binding counts incremented
  bnd-global : Globals → List String → Globals
  bnd-global global (nam :: nams) = do
    let global = case (BinMap.get global (hash nam)) of λ where
      (Some (_ , bnd , use)) → BinMap.set global (hash nam) (nam , bnd + 1 , use)
      None                   → BinMap.set global (hash nam) (nam , 1 , 0)
    bnd-global global nams
  bnd-global global [] = global

-- Checks for unbound variables in a term
-- - term: The term to check for unbound variables
-- - scope: The current scope of bound variables
-- - global: The global variable map
-- = A Result containing either an updated global variable map or an error message
unbound-vars-term : Term → List String → Globals → Result Globals String

unbound-vars-term (Var nam) scope global =
  if (scope-contains nam scope)
  then Done global
  else Fail ("Unbound variable '" ++ nam ++ "'")

unbound-vars-term (Link nam) scope global = do
  Done (use-global global nam)

unbound-vars-term term scope global = do
  let global = case term of λ where
    (Lam pat _)   → bnd-global global (Pat.unscoped-binds pat)
    (Let pat _ _) → bnd-global global (Pat.unscoped-binds pat)
    _             → global
  mfoldl (λ global (bnd , child) →
    unbound-vars-term child (List.append bnd scope) global)
    global (children-with-binds term)

-- Checks for unbound variables in a function definition
-- - def: The function definition to check
-- = A Result containing either Unit (success) or an error message
unbound-vars-def : FnDef → Result Unit String
unbound-vars-def def = do
  global ← mfoldl (λ global rule → do
                    let scope = concat (map Pat.binds (Rule.pats rule))
                    global ← unbound-vars-term (Rule.body rule) scope global
                    Done global)
                  BinMap.new (FnDef.rules def)
  let errs = foldr (λ { (var , (declared , used)) acc →
                      case (declared , used) of λ where
                        (1 , 1) → acc
                        (0 , _) → ("Unbound unscoped variable '" ++ var ++ "'") :: acc
                        (_ , 0) → ("Unscoped variable '" ++ var ++ "' is never used") :: acc
                        (_ , _) → ("Unscoped variable '" ++ var ++ "' is declared or used more than once") :: acc })
                    [] (BinMap.values global)
  case errs of λ where
    [] → Done unit
    (err :: _) → Fail err

-- Checks for unbound variables in an entire Book
-- - book: The Book to check for unbound variables
-- = A Result containing either Unit (success) or an error message
unbound-vars : Book → Result Unit String
unbound-vars book =
  mfoldl (λ _ def → unbound-vars-def def)
          unit
          (BinMap.values (Book.defs book))

