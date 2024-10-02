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

initial-keys : OrdMap String Bool
initial-keys = insert ("A" , False) empty

-- Creates a default player with initial values.
-- The keys map contains "A" set to True and "D" set to False.
-- = A Player record with default values and predefined keys.
init : Player
init = MkPlayer Zero "Default Player" initial-keys
