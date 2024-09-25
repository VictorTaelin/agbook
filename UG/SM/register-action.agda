module UG.SM.register-action where

open import UG.SM.Type
open import UG.SM.Time.Type
open import UG.SM.Tick.Type
open import UG.SM.Time.time-to-tick
open import UG.SM.StateLogs.Type
open import UG.SM.ActionLogs.Type
open import UG.SM.ActionLogs.add-action
open import UG.SM.ActionLogs.get-actions
open import UG.SM.TimedAction.Type
open import UG.SM.action-in-list
open import UG.SM.update-genesis-tick
open import UG.SM.update-cached-tick
open import UG.SM.remove-future-states
open import UG.SM.add-action-to-logs

open import Base.Nat.Type
open import Base.Nat.lt
open import Base.Nat.eq
open import Base.Nat.sub
open import Base.List.Type
open import Base.List.filter
open import Base.Maybe.Type
open import Base.String.Type
open import Base.String.eq
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Bool.or

-- mach: The current state machine
-- timedAction: The action to be registered, containing the action and its associated time
-- = Returns an updated state machine with the new action registered
register-action : ∀ {S A : Set} -> Mach S A -> TimedAction A -> Mach S A
register-action mach (record { action = action ; time = time }) = do
  let tick = time-to-tick mach time
  let mach1 = update-genesis-tick mach tick
  let mach2 = update-cached-tick mach1 tick
  let mach3 = remove-future-states mach2 tick
  add-action-to-logs mach3 tick action

