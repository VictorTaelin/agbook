module UG.SIPD.GameMap.GameMap where

open import Base.OrdMap.OrdMap
open import Base.Nat.Nat
open import UG.SIPD.Body.Body
open import Base.String.String

record GameMap (S : Set) : Set where
  constructor MkGameMap
  field
    width : Nat
    height : Nat
    bodies : OrdMap String (Body S)

