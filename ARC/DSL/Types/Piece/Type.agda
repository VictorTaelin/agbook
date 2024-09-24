module ARC.DSL.Types.Piece.Type where

open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Grid.Type
open import ARC.DSL.Types.Patch.Type

Piece : Set
Piece = Union Grid Patch
