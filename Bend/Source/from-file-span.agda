module Bend.Source.from-file-span where

open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Bend.Source.Source
open import Bend.Source.SourceKind

-- TODO: Stub
from-file-span : Nat → Nat → Source
from-file-span start end = MkSource None None SourceKind.Generated
