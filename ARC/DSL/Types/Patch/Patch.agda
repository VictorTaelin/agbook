module ARC.DSL.Types.Patch.Patch where

open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Object.Object
open import ARC.DSL.Types.Indices.Indices

Patch : Set
Patch = Union Object Indices
