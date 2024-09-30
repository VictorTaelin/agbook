module HVM2.Run.fresh where

open import HVM2.Run.Run
open import HVM2.Run.State.State
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
open import Base.Nat.Nat
open import Base.Nat.add
import Base.Nat.show as Nat

-- Generates a fresh variable by incrementing the current vars counter in the State.
-- Returns a pair containing the fresh Bits and updates the State.
fresh : Run String
fresh = λ state → do
  let new-vars  = (State.vars state) + 1
  let new-state = record state { vars = new-vars }
  new-state , ("_v" ++ Nat.show (State.vars state))
