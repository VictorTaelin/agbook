module ARC.DSL.Types.Numerical.Numerical where

open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.IntegerPair.IntegerPair

Numerical : Set
Numerical = Union Integer IntegerPair

