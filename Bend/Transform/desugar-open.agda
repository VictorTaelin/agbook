module Bend.Transform.desugar-open where

open import Base.Function.case
open import Base.List.List
open import Base.List.mmap
open import Base.Maybe.Maybe
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.String.append
open import Base.Trait.Monad
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.get-adt-ctrs
open import Bend.Fun.Book.mmap-rules
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.mmap-children
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module MatchRule = MatchRule' Term
  open module Rule = Rule' Term

-- Desugars 'open' expressions in a Book
-- - book: The Book to desugar
-- = Either the desugared Book or an error message
desugar-open : Book → Result Book String
desugar-open book = mmap-rules desugar-rule book

  where mutual
  -- Desugars 'open' expressions in a term
  -- - adts: The map of ADTs
  -- - term: The term to desugar
  -- = Either the desugared term or an error message
  desugar-term : Book → Term → Result Term String

  desugar-term book (Open typ var bod) = do
    case (get-adt-ctrs book typ) of λ where
      (Some (ctr :: [])) → do
        bod ← desugar-term book bod
        pure (Mat (Some var) (Var var) [] [] (MkMatchRule (Some (Ctr.nam ctr)) [] bod :: []))
      (Some _) → do
        Fail ("Type '" ++ typ ++ "' of an 'open' doesn't have exactly one constructor")
      None → do
        Fail ("Type '" ++ typ ++ "' of an 'open' is not defined")

  desugar-term book (Def def nxt) = do
    rules ← mmap desugar-rule (FnDef.rules def)
    nxt ← desugar-term book nxt
    pure (Def (record def { rules = rules }) nxt)

  desugar-term book term = do
    mmap-children (desugar-term book) term

  desugar-rule : Rule → Result Rule String
  desugar-rule rule = do
    body ← desugar-term book (Rule.body rule)
    pure (record rule { body = body })
