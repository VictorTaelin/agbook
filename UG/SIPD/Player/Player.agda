module UG.SIPD.Player.Player where

open import Base.Nat.Nat
open import Base.String.String
open import Base.OrdMap.OrdMap
open import Base.Bool.Bool
open import UG.SIPD.Hero.Hero
open import Base.V2.V2
open import Base.Pair.Pair

record Player (S : Set) : Set where
  constructor MkPlayer
  field
    id : Nat
    name : String
    keys : OrdMap String (Pair Bool V2)
    target : V2
    hero : Hero S

