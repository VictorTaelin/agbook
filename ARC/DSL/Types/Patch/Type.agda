module ARC.DSL.Types.Patch.Type where

open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Object.Type
open import ARC.DSL.Types.Indices.Type

Patch : Set
Patch = Union Object Indices
