module UG.SIPD.Body.Body where

open import Base.List.List
open import Base.String.String
open import Base.V2.V2
open import UG.SIPD.Effect.EffectType
open import UG.Shape.Shape

record Body (S : Set) : Set where
  constructor MkBody
  field
    id : String
    hitbox : Shape 
    tick : S → S
    effects : List (EffectType S)

