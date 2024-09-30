module Bend.Source.is-builtin where

open import Base.Bool.Bool
open import Bend.Source.Source
open import Bend.Source.SourceKind

is-builtin : Source -> Bool
is-builtin (MkSource _ _ Builtin) = True
is-builtin _                      = False
