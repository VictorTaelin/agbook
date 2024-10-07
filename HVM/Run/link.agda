module HVM.Run.link where

open import Base.Either.Either
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Base.Unit.Unit
open import HVM.Addr.Addr
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Run.redex-push
open import HVM.Run.subst-swap
open import HVM.Run.subst-take
open import HVM.Term.Term

mutual

  {-# TERMINATING #-}
  -- Links a non-var term to a term
  link-nod : Term → Term → Run (Maybe Addr)
  link-nod a (Var b-nam b-loc) = do
    subst b-nam b-loc a
    pure (Some b-loc)
  link-nod a b = do
    redex-push a b
    pure None

  {-# TERMINATING #-}
  -- Links two arbitrary terms
  link : Term → Term → Run (Pair (Maybe Addr) (Maybe Addr))
  link (Var a-nam a-loc) b = do
    subst a-nam a-loc b
  link a (Var b-nam b-loc) = do
    subst b-nam b-loc a
  link a b = do
    redex-push a b
    (None , None)

  {-# TERMINATING #-}
  subst : String → Addr → Term → Run (Maybe Addr)
  subst x addr b = do
    old-val ← subst-swap x b
    case old-val of λ where
      None →
        pure unit
      (Some term) → do
        subst-take x
        link term b
