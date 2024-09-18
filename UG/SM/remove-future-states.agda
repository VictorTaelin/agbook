module UG.SM.remove-future-states where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type
open import UG.SM.StateLogs.remove-range

open import Base.Nat.Type
open import Base.Nat.add

-- mach : The machine state to update
-- tick : The current tick, used to determine which states to remove
-- = Returns an updated Mach with future states removed from state-logs
remove-future-states : ∀ {S A : Set} → Mach S A → Tick → Mach S A 
remove-future-states mach tick = 
  record mach { state-logs = remove-range (Mach.state-logs mach) (add tick 1) (Mach.cached-tick mach) }
