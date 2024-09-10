module Bend.Fun.TextSpan.Type where

open import Bend.Fun.TextLocation.Type

record TextSpan : Set where
  constructor MkTextSpan
  field
    start : TextLocation
    end   : TextLocation
