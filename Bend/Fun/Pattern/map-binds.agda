module Bend.Fun.Pattern.map-binds where

open import Base.Maybe.Type
open import Base.String.Type
open import Bend.Fun.Pattern.Type
open import Bend.Fun.Pattern.map-children

map-binds : (Maybe String -> Maybe String) -> Pattern -> Pattern
map-binds f (Var x) = Var (f x)
map-binds f pat     = map-children (map-binds f) pat
