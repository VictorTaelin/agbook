module Bend.Transform.fix-match-terms where

open import Base.BitMap.BitMap
open import Base.BitMap.contains
open import Base.BitMap.empty
open import Base.BitMap.set
open import Base.BitMap.get
open import Base.BitMap.to-list
open import Base.BitMap.from-list
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Function.case
open import Base.Function.id
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.List.List
open import Base.List.foldr
open import Base.List.map
open import Base.List.mmap
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.String.append
open import Base.String.neq
open import Base.String.hash
open import Base.Trait.Monad
open import Base.Unit.Unit
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.get-ctr
open import Bend.Fun.Book.get-adt
open import Bend.Fun.Book.get-adt-ctrs
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Adt.CtrField
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.mmap-children
import Base.Maybe.fold as Maybe
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term
  open module MatchRule = MatchRule' Term

  -- Given the rules of a match term, return the bodies that match each of the
  --  constructors of the matched ADT.
  -- If one of the constructors is not covered, it won't be present in the map.
  term-per-ctr : String → Book → String → BitMap Term → List MatchRule → Result (BitMap Term) String

  term-per-ctr bnd book adt-nam bods [] = Done bods

  term-per-ctr bnd book adt-nam bods ((MkMatchRule nam _ bod) :: arms)
    with (get-ctr book (Maybe.fold "" id nam))

  -- Concrete constructor case
  ... | (Some (MkCtr nam adt _ fields)) = do
    if adt-nam != adt
      then Fail ("ADT mismatch in match term. Expected constructor of type " ++ adt-nam ++ ", but got " ++ nam ++ "of type " ++ adt)
      else Done unit
    if contains bods (hash nam)
      then Fail ("Duplicate match arms for constructor " ++ nam)
      else Done unit
    let bods = set bods (hash nam) bod
    term-per-ctr bnd book adt-nam bods arms

  -- Var case, use the body of this rule for all remaining constructors
  ... | None = do
    ctrs <- to-result (get-adt-ctrs book adt-nam) "No such ADT"
    let bods = foldr (λ ctr bods → do
                        let key = hash (Ctr.nam ctr)
                        if (contains bods key)
                          then bods
                          else (set bods key (Use nam (Var bnd) bod)))
                      bods ctrs
    term-per-ctr bnd book adt-nam bods arms

  -- Makes the normalized version of one of a match's arms.
  fix-match-arm : String → BitMap Term → Ctr → Result MatchRule String
  fix-match-arm bnd bods (MkCtr nam adt typ fields) = do
    let bnds = map CtrField.nam fields
    let bnds = map (λ b → Some (bnd ++ "." ++ b)) bnds
    bod <- to-result (get bods (hash nam)) ("Non exhaustive match of type " ++ adt ++ ", missing " ++ nam ++ " case")
    Done (MkMatchRule (Some nam) bnds bod)

  -- Makes the normalized version of all of a match's arms.
  fix-match : Book → Maybe String → Term → List (Maybe String) → List Term → List MatchRule
              → Result (List MatchRule) String
  fix-match book bnd arg with-bnd with-arg arms@((MkMatchRule nam bnds body) :: _)
    with (get-ctr book (Maybe.fold "" id nam))
  ... | (Some (MkCtr nam adt _ fields)) = do
    bnd  <- to-result bnd "Match with no bind"
    ctrs <- to-result (get-adt-ctrs book adt) "No such ADT"
    bods <- term-per-ctr bnd   book adt empty arms
    arms <- mmap (fix-match-arm bnd bods) ctrs
    Done arms
  ... | None = Fail "Irrefutable match"  -- TODO: A warning + make it a let/use term.
  fix-match book bnd arg with-bnd with-arg [] = Fail "Empty match arms"

  -- Normalizes all the pattern matching sub-terms in a term.
  fix-term : Book → Term → Result Term String
  fix-term book term = do
    term <- mmap-children (fix-term book) term
    case term of λ where
      (Mat bnd arg with-bnd with-arg arms) → do
        arms <- fix-match book bnd arg with-bnd with-arg arms
        Done (Mat bnd arg with-bnd with-arg arms)
      (Fold bnd arg with-bnd with-arg arms) → do
        arms <- fix-match book bnd arg with-bnd with-arg arms
        Done (Mat bnd arg with-bnd with-arg arms)
      _ → do
        Done term

  fix-rule : Book → Rule → Result Rule String
  fix-rule book (MkRule pats bod) = do
    bod <- fix-term book bod
    Done (MkRule pats bod)

  fix-def : Book → FnDef → Result FnDef String
  fix-def book (MkFnDef name typ check rules src) = do
    rules <- mmap (fix-rule book) rules
    Done (MkFnDef name typ check rules src)

-- Convert all match terms to a normalized form.
-- * Resolve the constructors and create the name of the field variables.
-- * Check for redundant arms and non-exhaustive matches.
-- * Converts the initial bind to an alias on every arm, rebuilding the eliminated constructor
--
-- Example:
-- For the program
-- ```bend
-- type MyList = (Cons h t) | Nil
-- match x = x {
--   MyList/Cons: (A x.h x.t)
--   a: B
-- }
-- ```
-- The following AST transformations will be made:
-- * The binds `x.h` and `x.t` will be generated and stored in the match term.
-- * If it was missing one of the match cases, we'd get an error.
-- * If it included one of the cases more than once (including wildcard patterns), we'd get a warning.
-- TODO: It currently errors on redundant/unreachable arms
-- ```bend
-- match x = x {
--   MyList/Cons x.h x.t: (A x.h x.t)
--   MyList/Nil: use a = x; B
-- }
-- ```
fix-match-terms : Book → Result Book String
fix-match-terms book = do
  defs <- mmap (λ (key , def) → do
                  def <- fix-def book def
                  Done (key , def))
                (to-list (Book.defs book))
  Done (record book { defs = from-list defs })
