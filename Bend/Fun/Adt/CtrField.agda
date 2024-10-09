module Bend.Fun.Adt.CtrField where

open import Base.Bool.Bool
open import Base.String.String
open import Bend.Fun.Type.Type

record CtrField : Set where
  constructor MkCtrField
  field
    nam : String
    rec : Bool
    typ : Type

