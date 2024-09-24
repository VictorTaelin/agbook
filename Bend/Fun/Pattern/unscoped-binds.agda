module Bend.Fun.Pattern.unscoped-binds where

open import Base.List.Type
open import Base.List.concat-map
open import Base.String.Type
open import Bend.Fun.Pattern.Type
open import Bend.Fun.Pattern.children

unscoped-binds : Pattern → List String
unscoped-binds (Chn nam) = nam :: []
unscoped-binds pat = concat-map unscoped-binds (children pat)
