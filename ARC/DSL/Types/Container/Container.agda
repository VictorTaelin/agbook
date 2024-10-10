module ARC.DSL.Types.Container.Container where

open import ARC.DSL.Types.List.List public
open import ARC.DSL.Types.OrdSet.OrdSet public
open import ARC.DSL.Types.Pair.Pair public

data Container (A : Set) : Set where
  AsPair : Pair A A → Container A
  AsList : List A   → Container A
  AsOSet : OrdSet A → Container A

module L where
  open import ARC.DSL.Types.List.Functions public

module O where
  open import ARC.DSL.Types.OrdSet.Functions public

module P where
  open import ARC.DSL.Types.Pair.Functions public

