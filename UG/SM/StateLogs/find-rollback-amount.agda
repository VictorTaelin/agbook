module UG.SM.StateLogs.find-rollback-amount where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.lt
open import Base.Pair.Pair
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick

-- Helper function to find the number of states to roll back.
-- - target-tick: The tick to roll back to.
-- - states: The current state logs.
-- - rollback-amount: Accumulator for the number of states to roll back.
-- = The number of states to roll back to reach the target tick.
find-rollback-amount-helper : ∀ {S : Set} → Tick → StateLogs S → Nat → Nat
find-rollback-amount-helper target-tick None rollback-amount = rollback-amount
find-rollback-amount-helper target-tick (Some node) rollback-amount with (lt target-tick (StateNode.tick node))
... | False = rollback-amount
... | True = find-rollback-amount-helper target-tick (StateNode.older node) (Succ rollback-amount)

-- Finds the number of states to roll back to reach a specific tick.
-- - target-tick: The tick to roll back to.
-- - states: The current state logs.
-- = The number of states to roll back to reach the target tick.
find-rollback-amount : ∀ {S : Set} → Tick → StateLogs S → Nat
find-rollback-amount target-tick states = find-rollback-amount-helper target-tick states Zero
