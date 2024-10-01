module UG.SM.StateLogs.rollback where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.lt
open import Base.Pair.Pair
open import UG.SM.StateLogs.StateLogs

-- Helper function for rollback operation.
-- - i: Current iteration count.
-- - amount: Total number of states to roll back.
-- - states: Current state of the logs.
-- - cut: Accumulated life of removed states.
-- = A pair containing the rolled back states and the total cut amount.
rollback-helper : ∀ {S : Set} → Nat → Nat → StateLogs S → Nat → Pair (StateLogs S) Nat
rollback-helper i amount states cut with (lt i amount)
... | False = (states , cut)
... | True with states
...   | None = (None , cut)
...   | Some state = do
  let cut = cut + (StateNode.life state) + 1
  let states = (StateNode.older state)
  rollback-helper (i + 1) amount states cut
  
-- Rolls back the state logs by a specified amount.
-- - amount: Number of states to roll back.
-- - states: The current state logs.
-- = The new state logs after rolling back.
rollback : ∀ {S : Set} → Nat → StateLogs S → StateLogs S
rollback amount states with states
... | None = None
... | Some _ with (rollback-helper 0 amount states) 0
...   | (None , _) = None
...   | (Some node , cut) = do
  let tick = StateNode.tick node
  let keep = Zero 
  let life = (StateNode.life node) + cut
  let state = StateNode.state node
  let older = StateNode.older node
  Some (MkStateNode tick keep life state older)
