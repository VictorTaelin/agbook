module UG.SM.get-initial-state where

open import Base.Bool.Bool
open import Base.Pair.Pair
open import Base.BitMap.get
open import Base.Maybe.Maybe
open import Base.Nat.to-bits
open import UG.SM.Game.Game
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick

-- Retrieves the initial state and tick for computation.
-- - mach: The state machine containing state logs.
-- - game: The game object with an init function for default state.
-- = Returns a pair containing:
--   - The initial state of type S
--   - The initial tick to start computation from
-- Note: If state logs exist, it returns the most recent logged state and its tick.
--       Otherwise, it returns the game's initial state and the machine's genesis tick.
get-initial-state : ∀ {S A : Set} → Mach S A → Game S A → Pair S Tick
get-initial-state mach game with (Mach.state-logs mach)
... | Some node = (StateNode.state node , StateNode.tick node)
... | None       = (Game.init game , Mach.genesis-tick mach)
