module ARC.DSL.Functions.height where

open import ARC.DSL.Types.Piece.Piece
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Grid.Grid
open import ARC.DSL.Types.Patch.Patch
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.List.List
open import ARC.DSL.Functions.size
open import ARC.DSL.Functions.add
open import ARC.DSL.Functions.subtract
open import ARC.DSL.Functions.lowermost
open import ARC.DSL.Functions.uppermost

-- Calculates the height of a Piece (Grid or Patch).
-- - piece: The input Piece.
-- = The height of the Piece.
height : Piece → Integer
height (Lft grid) = size (AsList grid)
height (Rgt patch) = add (subtract (lowermost patch) (uppermost patch)) 1

