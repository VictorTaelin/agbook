module ARC.DSL.Functions.repeat where

open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.List.Type
import ARC.DSL.Types.List.Functions as L

-- Repeats an element a specified number of times.
-- - item: The element to repeat.
-- - num: The number of times to repeat the item.
-- = A List of A containing 'num' repetitions of 'item'.
repeat : ∀ {A : Set} → A → Integer → List A
repeat item num = L.replicate num item
-- TODO: when we change Integers from Nat to Int under the hood,
--       use the implementation below:
-- repeat item num = L.replicate (I.to-nat num) item
