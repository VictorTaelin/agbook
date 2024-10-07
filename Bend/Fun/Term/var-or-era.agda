module Bend.Fun.Term.var-or-era where

open import Base.Maybe.Maybe
open import Base.String.String
open import Bend.Fun.Term.Term

var-or-era : Maybe String → Term
var-or-era (Some nam) = Var nam
var-or-era None       = Era
