module Bend.Fun.Pattern.map-binds where

open import Base.Maybe.Maybe
open import Base.String.String
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Pattern.map-children

map-binds : (Maybe String → Maybe String) → Pattern → Pattern
map-binds f (Var x) = Var (f x)
map-binds f pat     = map-children (map-binds f) pat
