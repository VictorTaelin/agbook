module UG.SM.get-initial-state where

open import Base.BitMap.get
open import Base.Maybe.Maybe
open import Base.Nat.to-bits
open import UG.SM.Game.Game
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick

-- get-initial-state: Helper function to get initial state.
-- mach: The machine containing state logs.
-- game: The game object with an init function.
-- ini-t: The initial tick.
-- = Returns the initial state of type S.
get-initial-state : ∀ {S A : Set} -> Mach S A -> Game S A -> Tick -> S
get-initial-state mach game ini-t with get (Mach.state-logs mach) (to-bits ini-t)
... | Some state = state
... | None       = Game.init game
