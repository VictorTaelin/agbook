module Bend.Fun.Adt.Ctr where

open import Base.List.List
open import Base.String.String
open import Bend.Source.Source
open import Bend.Fun.Type.Type using (Type)
open import Bend.Fun.Adt.CtrField

record Ctr : Set where
  constructor MkCtr
  field
    nam    : String
    adt    : String
    typ    : Type
    fields : List CtrField
