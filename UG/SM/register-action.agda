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

open import Data.Nat.Type
open import Data.Nat.lt
open import Data.Nat.eq
open import Data.Nat.sub
open import Data.List.Type
open import Data.List.filter
open import Data.Maybe.Type
open import Data.String.Type
open import Data.String.eq
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.or

register-action : ∀ {S A : Set} → Mach S A → TimedAction A → Mach S A
register-action mach (record { action = action ; time = time }) =
  let tick = time-to-tick mach time
      mach1 = update-genesis-tick mach tick
      mach2 = update-cached-tick mach1 tick
      mach3 = remove-future-states mach2 tick
  in add-action-to-logs mach3 tick action

