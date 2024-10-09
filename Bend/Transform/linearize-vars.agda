module Bend.Transform.linearize-vars where

open import Base.BinMap.BinMap
open import Base.BinMap.empty
open import Base.BinMap.get
open import Base.BinMap.set
open import Base.Bool.if
open import Base.Function.case
open import Base.List.List renaming (List to List')
open import Base.List.map
open import Base.List.foldr
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.Trait.Eq
open import Base.Nat.gt
open import Base.Nat.show
open import Base.Nat.range
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.String.String
open import Base.String.append
open import Base.String.hash
open import Base.Trait.Eq
open import Bend.Fun.Book.Book
open import Bend.Fun.FanKind.FanKind
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.map-children-with
open import Bend.Fun.Term.map-child-binds
open import Bend.Fun.Pattern.Pattern
open import Bend.Transform.subst
import Base.BinMap.to-list as BinMap
import Base.BinMap.from-list as BinMap
import Bend.Fun.Pattern.binds as Pat
import Bend.Fun.Rule.Rule as Rule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module Rule = Rule' Term
  open module FnDef = FnDef' Term

-- Creates a new name by appending the use count to the original name.
-- If the use count is 1, it returns the original name.
-- - name: The original variable name.
-- - uses: The number of times the variable is used.
-- = The new name, possibly with a use count appended.
dup-name : String → Nat → String
dup-name name uses = if uses == 1 then name else name ++ "_" ++ show uses

-- Retrieves the number of uses for a given variable name from the BinMap.
-- Returns 0 if the variable is not found or if the name is None.
-- - name: The name of the variable to look up.
-- - var-uses: The BinMap containing variable use counts.
-- = The number of uses for the given variable.
get-var-uses : Maybe String → BinMap Nat → Nat
get-var-uses None _ = 0
get-var-uses (Some name) var-uses =
  case get var-uses (hash name) of λ where
    (Some count) → count
    None         → 0

-- Creates a duplicate pattern for variables used multiple times.
-- The pattern is a Fan of Dup kind with variables named name_1, name_2, etc.
-- - name: The original variable name.
-- - uses: The number of times the variable is used.
-- = A Fan pattern with duplicated variables.
duplicate-pat : String → Nat → Pattern
duplicate-pat name uses =
  Fan FanKind.Dup (map (λ i → Var (Some (dup-name name i))) (range 1 (Succ uses)))

-- Main function to linearize variables in a term.
-- It transforms the term to ensure each variable is used at most once.
-- - term: The term to linearize.
-- - var-uses: A BinMap tracking variable use counts.
-- = The linearized term.
linearize-vars-term : BinMap Nat → Term → (Pair (BinMap Nat) Term)

-- Let terms with just a variable get inlined
linearize-vars-term var-uses (Let (Var (Some nam)) val nxt) = do
  let var-uses , nxt = linearize-vars-term var-uses nxt
  let uses           = get-var-uses (Some nam) var-uses
  let var-uses , val = linearize-vars-term var-uses val
  let term           = case uses of λ where
    0 → Let (Var None) val nxt
    1 → subst nam val nxt
    _ → Let (duplicate-pat nam uses) val nxt
  (var-uses , term)

-- Count var uses and update the name to the duplication
linearize-vars-term var-uses (Var nam) = do
  let count     = get-var-uses (Some nam) var-uses
  let new-count = Succ count
  let var-uses  = set var-uses (hash nam) new-count
  let term      = Var (dup-name nam new-count)
  (var-uses , term)

linearize-vars-term var-uses term = do
  -- linearize the children
  let var-uses , term = map-children-with linearize-vars-term var-uses term
  -- erase unused bindings
  let term = map-child-binds (λ bind _ → erase-unused-bind bind var-uses) term
  -- add duplications of bindings
  let term = duplicate-term term var-uses
  var-uses , term

  where

  -- Erases bindings that are not used (count is 0)
  -- - bind: The binding to check.
  -- - var-uses: The BinMap containing variable use counts.
  -- = The binding if used, None otherwise.
  erase-unused-bind : Maybe String → BinMap Nat → Maybe String
  erase-unused-bind bind var-uses = if (get-var-uses bind var-uses) == 0 then None else bind

  -- Adds duplication bindings for variables used multiple times
  -- - bnd: List of bindings to check for duplication.
  -- - nxt: The term to wrap with Let expressions for duplicated variables.
  -- - var-uses: The BinMap containing variable use counts.
  -- = The term with added duplications for multiply-used variables.
  duplicate-binds : List' String → Term → BinMap Nat → Term
  duplicate-binds bnd nxt var-uses =
    foldr (λ bnd nxt → do
            let uses = get-var-uses (Some bnd) var-uses
            if uses > 1
              then Let (duplicate-pat bnd uses) (Var bnd) nxt
              else nxt)
          nxt bnd

  -- Applies duplication to specific term types (Lam and Let)
  -- - term: The term to potentially duplicate.
  -- - var-uses: The BinMap containing variable use counts.
  -- = The term with duplications applied if necessary.
  duplicate-term : Term → BinMap Nat → Term
  duplicate-term (Lam pat bod) var-uses = do
    let bod = duplicate-binds (Pat.binds pat) bod var-uses
    Lam pat bod
  duplicate-term (Let pat val nxt) var-uses = do
    let nxt = duplicate-binds (Pat.binds pat) nxt var-uses
    Let pat val nxt
  duplicate-term term var-uses = do
    term

-- Applies linearize-vars-term to all functions in the book
-- - book: The Book to linearize.
-- = A new Book with linearized variables in all functions.
linearize-vars : Book → Book
linearize-vars (MkBook defs adts ctrs) = do
  let map-body body = snd (linearize-vars-term empty body)
  let map-rule rule = record rule { body = map-body (Rule.body rule) }
  let map-def def   = record def { rules = map map-rule (FnDef.rules def) }
  let defs          = (BinMap.to-list defs)
  let defs          = map (λ (key , def) → (key , map-def def)) defs
  (MkBook (BinMap.from-list defs) adts ctrs)
