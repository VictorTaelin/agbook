module ARC.DSL.Types.ListList.Type where

open import ARC.DSL.Types.List.Type

ListList : (A : Set) -> Set
ListList A = List (List A)
