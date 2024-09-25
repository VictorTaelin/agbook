module ARC.DSL.Types.Element.Type where

open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Object.Type
open import ARC.DSL.Types.Grid.Type

Element : Set
Element = Union Object Grid
