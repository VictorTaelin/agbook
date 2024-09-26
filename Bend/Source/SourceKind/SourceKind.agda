module Bend.Source.SourceKind.SourceKind where

-- Origin of a source code element
data SourceKind : Set where
  Builtin   : SourceKind
  Generated : SourceKind
  User      : SourceKind
  Imported  : SourceKind
  Unknown   : SourceKind
