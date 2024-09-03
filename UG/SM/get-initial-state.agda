module UG.SM.get-initial-state where

open import UG.SM.Type
open import UG.SM.Game.Type
open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type

open import Data.Function.case using (case_of_)
open import Data.Map.get
open import Data.Map.set
open import Data.Nat.to-bits
open import Data.Maybe.Type

-- get-initial-state: Helper function to get initial state
-- mach: The machine containing state logs
-- game: The game object with an init function
-- ini-t: The initial tick
-- = Returns the initial state of type S
get-initial-state : ∀ {S A : Set} → Mach S A → Game S A → Tick → S
get-initial-state mach game ini-t =
  case get (Mach.state-logs mach) (to-bits ini-t) of
    λ { (Some state) → state
      ; Nothing      → Game.init game
      }
