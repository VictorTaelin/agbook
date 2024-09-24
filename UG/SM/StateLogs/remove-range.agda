module UG.SM.StateLogs.remove-range where

open import UG.SM.StateLogs.Type
open import UG.SM.Tick.Type

open import Base.BitMap.Type
open import Base.BitMap.del
open import Base.Nat.Type
open import Base.Nat.lt
open import Base.Nat.to-bits
open import Base.Bool.if

-- Removes state logs for ticks in the range (start_tick, end_tick].
-- - logs: The initial StateLogs.
-- - start_tick: The tick to start removing from (exclusive).
-- - end_tick: The tick to stop removing at (inclusive).
-- = The updated StateLogs with entries removed.
remove-range : ∀ {S : Set} -> StateLogs S -> Tick -> Tick -> StateLogs S
remove-range logs start_tick end_tick =
  if start_tick < end_tick
  then remove-range (del logs (to-bits (Succ start_tick))) (Succ start_tick) end_tick
  else logs
