module HVM.Runtime.interact where

open import Debug.Trace

open import HVM.Interaction.anni
open import HVM.Interaction.comm
open import HVM.Interaction.eras
open import HVM.Interaction.link
open import HVM.Interaction.void
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Bool.Type
open import Data.Unit.Type
open import HVM.Redex.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.pop-redex
open import HVM.Runtime.pure
open import HVM.Term.Type

interact : Runtime Bool
interact = do
  redex ← pop-redex
  case redex of λ where
    None     → pure False
    (Some r) → do
      case r of λ where
        (MkRedex (Var x)     b)           → trace "A" (link x b)
        (MkRedex a           (Var x))     → trace "B" (link x a)
        (MkRedex Era         Era)         → trace "C" void
        (MkRedex Era         (Con a1 a2)) → trace "D" (eras a1 a2)
        (MkRedex Era         (Dup a1 a2)) → trace "E" (eras a1 a2)
        (MkRedex (Con a1 a2) Era)         → trace "F" (eras a1 a2)
        (MkRedex (Dup a1 a2) Era)         → trace "G" (eras a1 a2)
        (MkRedex (Con a1 a2) (Con b1 b2)) → trace "H" (anni a1 a2 b1 b2)
        (MkRedex (Con a1 a2) (Dup b1 b2)) → trace "I" (comm a1 a2 b1 b2)
        (MkRedex (Dup a1 a2) (Con b1 b2)) → trace "J" (comm b1 b2 a1 a2)
        (MkRedex (Dup a1 a2) (Dup b1 b2)) → trace "K" (anni a1 a2 b1 b2)
      pure True
