module UG.SIPD.Player.Player where

open import Base.Nat.Nat
open import Base.String.String
open import Base.OrdMap.OrdMap
open import Base.Bool.Bool

record Player : Set where
  constructor MkPlayer
  field
    id : Nat
    name : String
    keys : OrdMap String Bool

