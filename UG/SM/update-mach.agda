module UG.SM.update-mach where

open import Base.BitMap.set
open import Base.Nat.max
open import Base.Nat.to-bits
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick

-- mach: The machine to be updated.
-- t: The new tick to update the machine with.
-- s: The new state to be added to the state logs.
-- = Returns an updated Mach with the new tick and state.
update-mach : ∀ {S A : Set} → Mach S A → Tick → S → Mach S A
update-mach mach t s = do
  let cached-tick = max (Mach.cached-tick mach) t
  let state-logs = set (Mach.state-logs mach) (to-bits t) s
  record mach { cached-tick = cached-tick ; state-logs = state-logs }

