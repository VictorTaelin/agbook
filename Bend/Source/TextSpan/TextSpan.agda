module Bend.Source.TextSpan.TextSpan where

open import Bend.Source.TextLocation.TextLocation

-- A span of text in a source file
record TextSpan : Set where
  constructor MkTextSpan
  field
    start : TextLocation  -- Starting location of the span
    end   : TextLocation  -- Ending location of the span
