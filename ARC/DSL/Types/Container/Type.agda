module ARC.DSL.Types.Container.Type where

open import ARC.DSL.Types.List.Type
open import ARC.DSL.Types.OrdSet.Type
open import ARC.DSL.Types.Pair.Type

data Container (A : Set) : Set where
  list : List A -> Container A
  set  : OrdSet A -> Container A
