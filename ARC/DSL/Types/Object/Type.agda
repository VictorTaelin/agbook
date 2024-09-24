module ARC.DSL.Types.Object.Type where

open import ARC.DSL.Types.Cell.Type
open import ARC.DSL.Types.OrdSet.Type

Object : Set
Object = OrdSet Cell
