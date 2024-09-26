module Base.List.dedup where

open import Base.Bool.Bool
open import Base.List.List
open import Base.OrdSet.contains
open import Base.OrdSet.empty
open import Base.OrdSet.insert
open import Base.OrdSet.OrdSet
open import Base.Trait.Ord

-- Removes duplicates from a list using an OrdSet.
-- - xs: The input list.
-- = A new list with duplicates removed, maintaining the original order of first occurrence.
dedup : ∀ {A : Set} {{_ : Ord A}} -> List A -> List A
dedup xs = go xs empty where
  go : ∀ {A : Set} {{_ : Ord A}} -> List A -> OrdSet A -> List A
  go [] acc = []
  go (x :: xs) acc with contains x acc
  ... | True  = go xs acc
  ... | False = x :: go xs (x ::> acc)
