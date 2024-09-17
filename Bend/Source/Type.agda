module Bend.Source.Type where

open import Data.Maybe.Type
open import Data.String.Type
open import Bend.Source.TextSpan.Type
open import Bend.Source.SourceKind.Type 

-- Information about the source of a code element
record Source : Set where
  constructor MkSource
  field
    file : Maybe String    -- The file containing the source
    span : Maybe TextSpan  -- The text span of the source
    kind : SourceKind      -- The kind of source
