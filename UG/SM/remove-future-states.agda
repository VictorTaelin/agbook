module UG.SM.remove-future-states where

open import Base.Nat.Nat
open import Base.Nat.add
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.StateLogs.find-rollback-amount
open import UG.SM.StateLogs.rollback
open import UG.SM.Tick.Tick

-- mach : The machine state to update.
-- tick : The current tick, used to determine which states to remove.
-- = Returns an updated Mach with future states removed from state-logs.
remove-future-states : ∀ {S A : Set} → Mach S A → Tick → Mach S A 
remove-future-states mach tick = do
  let rollback-amount = find-rollback-amount tick (Mach.state-logs mach)
  let new-logs = rollback rollback-amount (Mach.state-logs mach)
  record mach { state-logs = new-logs }

