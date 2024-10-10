module Bend.Source.Source where

open import Base.Maybe.Maybe
open import Base.String.String
open import Bend.Source.TextSpan
open import Bend.Source.SourceKind

-- Information about the source of a code element
record Source : Set where
  constructor MkSource
  field
    file : Maybe String    -- The file containing the source
    span : Maybe TextSpan  -- The text span of the source
    kind : SourceKind      -- The kind of source

