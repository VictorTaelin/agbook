module Base.List.ord where

open import Base.List.List
open import Base.Trait.Ord
import Base.List.compare as L

instance
  OrdList : ∀ {A : Set} {{_ : Ord A}} → Ord (List A)
  OrdList = make-ord L.compare
