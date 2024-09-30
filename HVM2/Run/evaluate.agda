module HVM2.Run.evaluate where

open import HVM2.Net.Net
open import HVM2.Term.Term
open import HVM2.Run.Run
open import HVM2.Run.State.State
open import HVM2.Run.Monad.bind
open import HVM2.Run.Monad.pure
open import HVM2.Run.normalize
open import HVM2.Run.state-get
open import HVM2.Run.materialize
open import HVM2.Run.State.boot
open import Base.Pair.Pair

-- Normalizes a Net into a Term
evaluate : Net → Term
evaluate net =
  let
    result : Run Term
    result = do
      normalize
      state <- state-get
      term <- materialize (Net.root (State.gnet state))
      pure term
  in
  snd (result (boot net))
