module ARC.DSL.Types.Container.Functions where

open import ARC.DSL.Types.Container.Container
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Functions.container-to-list

import Base.Trait.Ord as Ord
open import Base.Ordering.Ordering

compare : ∀ {A : Set} {{_ : Ord.Ord A}} → Container A → Container A → Ordering
compare x y = L.compare (container-to-list x) (container-to-list y)

OrdContainer : ∀ {A : Set} {{_ : Ord.Ord A}} → Ord.Ord (Container A)
OrdContainer = Ord.make-ord compare

