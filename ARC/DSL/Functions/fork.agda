module ARC.DSL.Functions.fork where

open import ARC.DSL.Types.Pair.Pair

-- Creates a wrapper function that applies two functions to an input
-- and combines their results using an outer function.
-- - outer: The function to combine the results of a and b.
-- - a: The first function to apply to the input.
-- - b: The second function to apply to the input.
-- - x: The input value.
-- = The result of applying outer to the pair of results from a and b.
fork : ∀ {A B C D : Set}
     → (B → C → D)  -- outer
     → (A → B)      -- a
     → (A → C)      -- b
     → A → D
fork outer a b x = outer (a x) (b x)

