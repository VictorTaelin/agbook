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

-- Retrieves the initial state for a given tick, or uses the game's initial state if not found.
-- - mach: The state machine containing state logs.
-- - game: The game object with an init function for default state.
-- - ini-t: The initial tick to look up in the state logs.
-- = Returns a pair containing:
--   - The initial state of type S
--   - A boolean indicating whether the game's init state was used (True) or a stored state was found (False)
get-initial-state : ∀ {S A : Set} -> Mach S A -> Game S A -> Tick -> Pair S Bool
get-initial-state mach game ini-t with get (Mach.state-logs mach) (to-bits ini-t)
... | Some state = (state , False)
... | None       = (Game.init game , True)
