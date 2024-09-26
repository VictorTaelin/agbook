module ARC.DSL.Types.Container.Container where

open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.OrdSet.OrdSet
open import ARC.DSL.Types.Pair.Pair

data Container (A : Set) : Set where
  list : List A -> Container A
  set  : OrdSet A -> Container A
