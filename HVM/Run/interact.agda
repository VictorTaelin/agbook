module HVM.Run.interact where

open import Base.Bool.Bool
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Unit.Unit
open import HVM.Redex.Redex
open import HVM.Rule.anni
open import HVM.Rule.comm
open import HVM.Rule.eras
open import HVM.Rule.link
open import HVM.Rule.void
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Run.redex-pop
open import HVM.Term.Term

interact : Run Bool
interact = do
  redex ← redex-pop
  case redex of λ where
    None     → pure False
    (Some r) → do
      case r of λ where
        (MkRedex (Var x)     b)           → link x b
        (MkRedex a           (Var x))     → link x a
        (MkRedex Era         Era)         → void
        (MkRedex Era         (Con a1 a2)) → eras a1 a2
        (MkRedex Era         (Dup a1 a2)) → eras a1 a2
        (MkRedex (Con a1 a2) Era)         → eras a1 a2
        (MkRedex (Dup a1 a2) Era)         → eras a1 a2
        (MkRedex (Con a1 a2) (Con b1 b2)) → anni a1 a2 b1 b2
        (MkRedex (Con a1 a2) (Dup b1 b2)) → comm a1 a2 b1 b2
        (MkRedex (Dup a1 a2) (Con b1 b2)) → comm b1 b2 a1 a2
        (MkRedex (Dup a1 a2) (Dup b1 b2)) → anni a1 a2 b1 b2
      pure True

