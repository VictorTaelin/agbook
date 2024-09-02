module UG.SM.add-action-to-logs where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import UG.SM.ActionLogs.Type
open import UG.SM.ActionLogs.add-action

-- mach: The machine state to update
-- tick: The tick at which the action occurred
-- action: The action to add to the logs
-- = An updated Mach S A with the new action added to its action logs
add-action-to-logs : ∀ {S A : Set} → Mach S A → Tick → A → Mach S A
add-action-to-logs mach tick action =
  record mach { action-logs = add-action (Mach.action-logs mach) tick action }
