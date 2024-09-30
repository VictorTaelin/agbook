module ARC.DSL.Functions.mpapply where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Functions.papply
open import ARC.DSL.Functions.merge

open import Base.Trait.Ord

-- Applies a function to pairs of elements from two containers and merges the results.
-- - A: The type of elements in the first container.
-- - B: The type of elements in the second container.
-- - C: The type of elements in the resulting container.
-- - fn: The function to be applied to each pair of elements.
-- - ca: The first input container.
-- - cb: The second input container.
-- = A new container with the function applied to pairs of elements and merged.
mpapply : ∀ {A B C : Set} {{_ : Ord C}}
    → (Container A → Container B → Container C)
    → Container (Container A)
    → Container (Container B)
    → Container C
mpapply fn ca cb = merge (papply fn ca cb)
