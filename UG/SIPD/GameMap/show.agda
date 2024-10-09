module UG.SIPD.GameMap.show where

open import Base.String.String
open import Base.String.append
open import Base.String.join
open import Base.List.map
import Base.Nat.show as Nat
open import UG.SIPD.GameMap.GameMap
import UG.SIPD.Body.show as Body
open import Base.OrdMap.values
open import Base.List.List

-- Converts a GameMap to its string representation.
-- - gameMap: The GameMap to convert.
-- = A string representation of the given GameMap.
show : ∀ {S : Set} → GameMap S → String
show gameMap = 
  let width = "width: " ++ Nat.show (GameMap.width gameMap)
      height = "height: " ++ Nat.show (GameMap.height gameMap)
      bodies = "bodies: [" ++ 
               join ", " (map Body.show (values (GameMap.bodies gameMap))) ++
               "]"
  in "GameMap { " ++ join ", " (width :: height :: bodies :: []) ++ " }"

