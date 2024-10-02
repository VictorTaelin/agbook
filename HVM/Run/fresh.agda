module HVM.Run.fresh where

open import HVM.Run.Run
open import HVM.Run.State.State
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
open import Base.Nat.Nat
open import Base.Nat.add
open import HVM.Mode.Mode
import Base.Nat.show as Nat

-- Generates a fresh variable by incrementing the current vars counter in the State.
-- In WIRED mode, it has no effect.
-- Returns a pair containing the fresh String (or empty string in WIRED mode) and updates the State.
fresh : ∀ {mode : Mode} → Run mode String
fresh {WIRED} = λ state → (state , "")
fresh {NAMED} = λ state → do
  let new-vars  = (State.vars state) + 1
  let new-state = record state { vars = new-vars }
  new-state , ("_v" ++ Nat.show (State.vars state))
