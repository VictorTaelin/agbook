module UG.SIPD.Player.init where

open import Base.Nat.Nat
open import Base.String.String
open import Base.OrdMap.OrdMap
open import Base.Bool.Bool
open import UG.SIPD.Player.Player
open import Base.OrdMap.empty
open import Base.OrdMap.insert
open import Base.Pair.Pair
open import Base.String.Trait.Ord
open import UG.SIPD.State.State
open import UG.SIPD.Hero.li-ming
open import UG.SIPD.Hero.Hero
open import Base.V2.V2

initial-keys : OrdMap String (Pair Bool V2)
initial-keys = insert ("A" , (False , (MkV2 0.0 0.0))) empty

p-hero : Hero State
p-hero = li-ming 0 (MkV2 300.0 300.0)

-- Creates a default player with initial values.
-- = A Player record with default values and predefined keys.
init : Player State
init = MkPlayer Zero "Default Player" initial-keys (MkV2 0.0 0.0) p-hero 

