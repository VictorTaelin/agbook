module ARC.DSL.Types.Element.Element where

open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Object.Object
open import ARC.DSL.Types.Grid.Grid

Element : Set
Element = Union Object Grid
