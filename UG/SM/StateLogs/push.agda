module UG.SM.StateLogs.push where

open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick

-- Pushes a new state onto the state logs.
-- - new-state: The new state to be added.
-- - states: The current state logs.
-- - t: The current tick.
-- = Updated state logs with the new state added.
--
-- This function handles several cases:
-- 1. If the states are empty (None), it creates a new StateNode.
-- 2. If the current node's keep value is Zero, it increments it.
-- 3. If the current node's keep value is non-zero:
--    a. If its life is Zero, it creates a new node and updates the current one.
--    b. If its life is non-zero, it creates a new node and resets the current one's life.
push : ∀ {S : Set} → S → StateLogs S → Tick → StateLogs S
push new-state states t with states
... | None = Some (MkStateNode t Zero Zero new-state None)
... | Some node with (StateNode.keep node)
...   | Zero = Some (record node { keep = Succ Zero })
...   | Succ _ with (StateNode.life node)
...     | Zero = Some (MkStateNode t Zero (StateNode.life node) new-state (Some (record node { keep = Zero ; older = (StateNode.older node) })))
...     | Succ new-life = Some (MkStateNode t Zero Zero new-state (Some (record node { keep = Zero ; life = new-life ; older = (StateNode.older node) })))
