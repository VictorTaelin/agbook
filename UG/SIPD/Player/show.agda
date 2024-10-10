module UG.SIPD.Player.show where

import Base.Nat.show as Nat
import Base.V2.show as V2
import UG.SIPD.Hero.show as Hero
open import Base.String.String
open import Base.String.append
open import UG.SIPD.Player.Player

-- Converts a Player to its string representation.
-- - player: The Player to convert.
-- = A string representation of the Player, showing its ID, name, and hero.
show : ∀ {S : Set} → Player S → String
show player =
  "Player ID: " ++ Nat.show (Player.id player)
  ++ "\nName: " ++ Player.name player
  ++ "\nTarget: " ++ V2.show (Player.target player)
  ++ "\n" ++ Hero.show (Player.hero player)

