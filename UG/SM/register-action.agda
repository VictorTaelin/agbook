module UG.SM.register-action where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.or
open import Base.List.List
open import Base.List.filter
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.lt
open import Base.Nat.sub
open import Base.String.String
open import Base.String.eq
open import UG.SM.ActionLogs.ActionLogs
open import UG.SM.ActionLogs.add-action
open import UG.SM.ActionLogs.get-actions
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick
open import UG.SM.Time.Time
open import UG.SM.Time.time-to-tick
open import UG.SM.TimedAction.TimedAction
open import UG.SM.action-in-list
open import UG.SM.add-action-to-logs
open import UG.SM.remove-future-states
open import UG.SM.update-cached-tick
open import UG.SM.update-genesis-tick

-- mach: The current state machine.
-- timedAction: The action to be registered, containing the action and its associated time.
-- = Returns an updated state machine with the new action registered.
register-action : ∀ {S A : Set} -> Mach S A -> TimedAction A -> Mach S A
register-action mach (record { action = action ; time = time }) = do
  let tick = time-to-tick mach time
  let mach = update-genesis-tick mach tick
  let mach = update-cached-tick mach tick
  let mach = remove-future-states mach tick
  add-action-to-logs mach tick action

