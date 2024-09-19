module UG.SM.Type where

open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type
open import UG.SM.ActionLogs.Type

open import Base.Nat.Type
open import Base.Bool.Type

-- S : The type of states in the state machine
-- A : The type of actions that can be performed on the state machine
-- = A record type representing a state machine
-- Fields:
--   ticks-per-second : The number of ticks that occur in one second
--   genesis-tick : The initial tick value when the machine was created
--   cached-tick : The most recently processed tick
--   state-logs : A log of states indexed by ticks
--   action-logs : A log of actions indexed by ticks
--   action-eq : A function to compare two actions for equality
record Mach (S A : Set) : Set where
  field
    ticks-per-second : Nat
    genesis-tick : Tick
    cached-tick : Tick
    state-logs : StateLogs S
    action-logs : ActionLogs A
    action-eq : A → A → Bool
