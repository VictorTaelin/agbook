module Bend.Fun.Pattern.unscoped-binds where

open import Base.List.List
open import Base.List.concat-map
open import Base.String.String
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Pattern.children

unscoped-binds : Pattern → List String
unscoped-binds (Chn nam) = nam :: []
unscoped-binds pat       = concat-map unscoped-binds (children pat)

