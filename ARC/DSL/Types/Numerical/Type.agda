module ARC.DSL.Types.Numerical.Type where

open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.IntegerPair.Type

Numerical : Set
Numerical = Union Integer IntegerPair
