module Bend.Fun.Source.Type where

open import Data.Maybe.Type
open import Data.String.Type
open import Bend.Fun.TextSpan.Type

data SourceKind : Set where
  Builtin   : SourceKind
  Generated : SourceKind
  User      : SourceKind
  Imported  : SourceKind
  Unknown   : SourceKind

record Source : Set where
  constructor MkSource
  field
    file : Maybe String
    span : Maybe TextSpan
    kind : SourceKind 
