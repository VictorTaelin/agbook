module Bend.Fun.Term.mmap-children where

open import Bend.Fun.Term.Term
open import Base.List.List renaming (List to List')
open import Base.List.mmap
open import Base.Maybe.Maybe
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.Trait.Monad
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Applies a function to all immediate child terms of a given term.
-- - f: The function to apply to each child term.
-- - term: The term whose children we want to map over.
-- = A new term with the function applied to all immediate children.
mmap-children : ∀ {M : Set -> Set} {{monadM : Monad M}} → (Term → M Term) → Term → M Term
mmap-children f (Lam pat bod) = do
  bod <- f bod
  pure (Lam pat bod)
mmap-children f (Var nam) = pure (Var nam)
mmap-children f (Link nam) = pure (Link nam)
mmap-children f (Let pat val nxt) = do
  val <- f val
  nxt <- f nxt
  pure (Let pat val nxt)
mmap-children f (With typ bod) = do
  bod <- f bod
  pure (With typ bod)
mmap-children f (Ask pat val nxt) = do
  val <- f val
  nxt <- f nxt
  pure (Ask pat val nxt)
mmap-children f (Use nam val nxt) = do
  val <- f val
  nxt <- f nxt
  pure (Use nam val nxt)
mmap-children f (App fun arg) = do
  fun <- f fun
  arg <- f arg
  pure (App fun arg)
mmap-children f (Fan kind els) = do
  els <- mmap f els
  pure (Fan kind els)
mmap-children f (Num val) = pure (Num val)
mmap-children f (Str val) = pure (Str val)
mmap-children f (List els) = do
  els <- mmap f els
  pure (List els)
mmap-children f (Oper op fst snd) = do
  fst <- f fst
  snd <- f snd
  pure (Oper op fst snd)
mmap-children f (Mat bnd arg with-bnd with-arg arms) = do
  arg      <- f arg
  with-arg <- mmap f with-arg
  arms     <- mmap (λ rule → do
                bod <- f (MatchRule.bod rule)
                pure (record rule { bod = bod })) arms
  pure (Mat bnd arg with-bnd with-arg arms)
mmap-children f (Swt bnd arg with-bnd with-arg pred arms) = do
  arg      <- f arg
  with-arg <- mmap f with-arg
  arms     <- mmap f arms
  pure (Swt bnd arg with-bnd with-arg pred arms)
mmap-children f (Fold bnd arg with-bnd with-arg arms) = do
  arg      <- f arg
  with-arg <- mmap f with-arg
  arms     <- mmap (λ rule → do
                bod <- f (MatchRule.bod rule)
                pure (record rule { bod = bod })) arms
  pure (Fold bnd arg with-bnd with-arg arms)
mmap-children f (Bend bnd arg cond step base) = do
  arg  <- mmap f arg
  cond <- f cond
  step <- f step
  base <- f base
  pure (Bend bnd arg cond step base)
mmap-children f (Open typ var bod) = do
  bod <- f bod
  pure (Open typ var bod)
mmap-children f (Ref nam) = pure (Ref nam)
mmap-children f (Def def nxt) = do
  nxt <- f nxt
  pure (Def def nxt)
mmap-children f Era = pure Era

