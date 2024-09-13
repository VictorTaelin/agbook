module Bend.Source.SourceKind.Type where

-- Origin of a source code element
data SourceKind : Set where
  Builtin   : SourceKind
  Generated : SourceKind
  User      : SourceKind
  Imported  : SourceKind
  Unknown   : SourceKind
