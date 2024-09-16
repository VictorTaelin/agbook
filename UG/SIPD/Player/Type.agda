module UG.SIPD.Player.Type where

open import Data.Nat.Type
open import Data.String.Type

-- Represents a player in the game
record Player : Set where
  constructor MkPlayer
  field
    id   : Nat
    name : String
