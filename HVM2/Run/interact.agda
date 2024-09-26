module HVM2.Run.interact where

open import Debug.Trace

open import Base.Bool.Bool
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Unit.Unit
open import HVM2.Redex.Redex
open import HVM2.Rule.anni
open import HVM2.Rule.comm
open import HVM2.Rule.eras
open import HVM2.Rule.link
open import HVM2.Rule.void
open import HVM2.Run.Monad.bind
open import HVM2.Run.Monad.pure
open import HVM2.Run.redex-pop
open import HVM2.Run.Run
open import HVM2.Term.Term

interact : Run Bool
interact = do
  redex <- redex-pop
  case redex of λ where
    None     -> pure False
    (Some r) -> do
      case r of λ where
        (MkRedex (Var x)     b)           -> trace "A" (link x b)
        (MkRedex a           (Var x))     -> trace "B" (link x a)
        (MkRedex Era         Era)         -> trace "C" void
        (MkRedex Era         (Con a1 a2)) -> trace "D" (eras a1 a2)
        (MkRedex Era         (Dup a1 a2)) -> trace "E" (eras a1 a2)
        (MkRedex (Con a1 a2) Era)         -> trace "F" (eras a1 a2)
        (MkRedex (Dup a1 a2) Era)         -> trace "G" (eras a1 a2)
        (MkRedex (Con a1 a2) (Con b1 b2)) -> trace "H" (anni a1 a2 b1 b2)
        (MkRedex (Con a1 a2) (Dup b1 b2)) -> trace "I" (comm a1 a2 b1 b2)
        (MkRedex (Dup a1 a2) (Con b1 b2)) -> trace "J" (comm b1 b2 a1 a2)
        (MkRedex (Dup a1 a2) (Dup b1 b2)) -> trace "K" (anni a1 a2 b1 b2)
      pure True
