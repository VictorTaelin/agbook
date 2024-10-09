module ARC.DSL.Types.Piece.Piece where

open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Grid.Grid
open import ARC.DSL.Types.Patch.Patch

Piece : Set
Piece = Union Grid Patch

