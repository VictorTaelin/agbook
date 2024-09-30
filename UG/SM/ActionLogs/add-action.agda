module UG.SM.ActionLogs.add-action where

open import Base.BitMap.BitMap
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.List.List
open import Base.List.append
open import Base.Maybe.Maybe
open import Base.Nat.to-bits
open import UG.SM.ActionLogs.ActionLogs
open import UG.SM.Tick.Tick

-- Adds an action to the ActionLogs at a specific tick.
-- If the tick already has a list of actions, the new action is appended to that list.
-- If the tick doesn't exist, a new list with the single action is created.
-- - logs: The original ActionLogs.
-- - t: The tick at which to add the action.
-- - a: The action to add.
-- = A new ActionLogs with the action added at the specified tick.
add-action : ∀ {A : Set} → ActionLogs A → Tick → A → ActionLogs A
add-action logs t a with get logs (to-bits t)
... | None         = set logs (to-bits t) (a :: [])
... | Some actions = set logs (to-bits t) (actions ++ (a :: []))

