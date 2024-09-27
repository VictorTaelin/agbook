module UG.SM.StateLogs.remove-range where

open import Base.BitMap.BitMap
open import Base.BitMap.del
open import Base.Bool.if
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Nat.lt
open import Base.Nat.to-bits
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick

-- Removes state logs for ticks in the range (start_tick, end_tick].
-- - logs: The initial StateLogs.
-- - start_tick: The tick to start removing from (exclusive).
-- - end_tick: The tick to stop removing at (inclusive).
-- = The updated StateLogs with entries removed.
remove-range : ∀ {S : Set} → StateLogs S → Tick → Tick → StateLogs S
remove-range logs start-tick end-tick with start-tick < end-tick
... | True  = remove-range (del logs (to-bits (Succ start-tick))) (Succ start-tick) end-tick
... | False = logs
