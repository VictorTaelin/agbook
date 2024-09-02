module UG.SM.Type where

open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type
open import UG.SM.ActionLogs.Type

open import Data.Nat.Type
open import Data.Bool.Type

record Mach (S A : Set) : Set where
  field
    ticks-per-second : Nat
    genesis-tick : Tick
    cached-tick : Tick
    state-logs : StateLogs S
    action-logs : ActionLogs A
    action-eq : A → A → Bool
