module HVM.Interaction.interact where

open import HVM.Interaction.anni
open import HVM.Interaction.comm
open import HVM.Interaction.eras
open import HVM.Interaction.link
open import HVM.Interaction.void
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Pair.Type
open import Data.Unit.Type
open import HVM.Redex.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.pop-redex
open import HVM.Runtime.pure
open import HVM.Term.Type

interact : Runtime Unit
interact = do
  redex ← pop-redex
  case redex of λ where
    None     → pure unit
    (Some r) → case r of λ where
      (MkRedex (Var x)     b)           → link x b
      (MkRedex a           (Var x))     → link x a
      (MkRedex Era         b)           → eras Era b
      (MkRedex a           Era)         → eras a Era
      (MkRedex (Con a1 a2) (Con b1 b2)) → anni a1 a2 b1 b2
      (MkRedex (Dup a1 a2) (Dup b1 b2)) → comm a1 a2 b1 b2
      (MkRedex a           b)           → void a b
