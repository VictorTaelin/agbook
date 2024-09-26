module ARC.DSL.Types.ListList.ListList where

open import ARC.DSL.Types.List.List

ListList : (A : Set) -> Set
ListList A = List (List A)
