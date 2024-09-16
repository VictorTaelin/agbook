module UG.SIPD.Action.Type where

open import UG.SM.Time.Type
open import UG.SIPD.Player.Type
open import Data.String.Type
open import Data.Bool.Type
open import Data.Nat.Type

data Action : Set where
  SetNick : Time → Player → String → Action
  SkillEvent : Time → Player → String → Bool → Nat → Nat → Action
  MouseClick : Time → Player → Nat → Nat → Action
  MovementEvent : Time → Player → String → Bool → Action
