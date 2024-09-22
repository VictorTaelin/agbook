module Bend.Source.from-file-span where

open import Base.Maybe.Type
open import Base.Nat.Type
open import Bend.Source.Type
open import Bend.Source.SourceKind.Type

-- TODO: Stub
from-file-span : Nat → Nat → Source
from-file-span start end = MkSource None None SourceKind.Generated
