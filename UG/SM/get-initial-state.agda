module UG.SM.get-initial-state where

open import UG.SM.SM
open import UG.SM.Game.Game
open import UG.SM.Tick.Tick
open import UG.SM.StateLogs.StateLogs

open import Base.Function.case using (case_of_)
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.Nat.to-bits
open import Base.Maybe.Maybe

-- get-initial-state: Helper function to get initial state
-- mach: The machine containing state logs
-- game: The game object with an init function
-- ini-t: The initial tick
-- = Returns the initial state of type S
get-initial-state : ∀ {S A : Set} -> Mach S A -> Game S A -> Tick -> S
get-initial-state mach game ini-t =
  case get (Mach.state-logs mach) (to-bits ini-t) of
    λ { (Some state) -> state
      ; Nothing      -> Game.init game
      }
