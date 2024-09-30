module Bend.Fun.Adt.Adt where

open import Base.List.List
open import Base.String.String
open import Bend.Source.Source

record Adt : Set where
  constructor MkAdt
  field
    name : String
    vars : List String
    ctrs : List String
    src  : Source
