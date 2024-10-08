module UG.SIPD.Body.Body where

open import Base.String.String
open import UG.Shape.Shape
open import Base.V2.V2

record Body (S : Set) : Set where
  constructor MkBody
  field
    id : String
    hitbox : Shape 
    tick : S → S

