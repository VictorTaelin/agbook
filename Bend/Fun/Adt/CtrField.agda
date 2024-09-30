module Bend.Fun.Adt.CtrField where

open import Base.Bool.Bool
open import Base.String.String
open import Bend.Fun.Type.Type

record CtrField : Set where
  constructor MkCtrField
  field
    name : String
    rec  : Bool
    type : Type
