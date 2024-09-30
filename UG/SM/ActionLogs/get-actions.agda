module UG.SM.ActionLogs.get-actions where

open import Base.BitMap.get
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Nat.to-bits
open import UG.SM.ActionLogs.ActionLogs
open import UG.SM.Tick.Tick

-- Retrieves the list of actions for a specific tick from the ActionLogs.
-- If no actions exist for the given tick, returns an empty list.
-- - logs: The ActionLogs to retrieve actions from.
-- - t: The tick for which to retrieve actions.
-- = The list of actions for the specified tick, or an empty list if none exist.
get-actions : ∀ {A : Set} → ActionLogs A → Tick → List A
get-actions logs t with get logs (to-bits t)
... | None         = []
... | Some actions = actions
