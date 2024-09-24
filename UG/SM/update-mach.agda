module UG.SM.update-mach where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type

open import Base.Nat.max
open import Base.BitMap.set
open import Base.Nat.to-bits

-- mach: The machine to be updated
-- t: The new tick to update the machine with
-- s: The new state to be added to the state logs
-- = Returns an updated Mach with the new tick and state
update-mach : ∀ {S A : Set} -> Mach S A -> Tick -> S -> Mach S A
update-mach mach t s =
  record mach
    { cached-tick = max (Mach.cached-tick mach) t
    ; state-logs = set (Mach.state-logs mach) (to-bits t) s
    }
