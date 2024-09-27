module UG.SM.remove-future-states where

open import Base.Nat.Nat
open import Base.Nat.add
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.StateLogs.remove-range
open import UG.SM.Tick.Tick

-- mach : The machine state to update.
-- tick : The current tick, used to determine which states to remove.
-- = Returns an updated Mach with future states removed from state-logs.
remove-future-states : ∀ {S A : Set} -> Mach S A -> Tick -> Mach S A 
remove-future-states mach tick = 
  record mach { state-logs = remove-range (Mach.state-logs mach) (add tick 1) (Mach.cached-tick mach) }
