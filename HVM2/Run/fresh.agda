module HVM2.Run.fresh where

open import HVM2.Run.Type
open import HVM2.Run.State.Type
open import Base.Pair.Type
open import Base.String.Type
open import Base.String.append
open import Base.Nat.Type
open import Base.Nat.add
import Base.Nat.show as Nat

-- Generates a fresh variable by incrementing the current vars counter in the State.
-- Returns a pair containing the fresh Bits and updates the State.
fresh : Run String
fresh = λ state -> do
  let new-vars  = (State.vars state) + 1
  let new-state = record state { vars = new-vars }
  new-state , ("_v" ++ Nat.show (State.vars state))
