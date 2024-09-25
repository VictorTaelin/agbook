module ARC.DSL.Types.Cell.Type where

open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Pair.Type
open import ARC.DSL.Types.IntegerPair.Type

Cell : Set
Cell = Pair Integer IntegerPair
