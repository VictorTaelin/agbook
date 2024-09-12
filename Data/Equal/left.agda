module Data.Equal.left where

open import Data.Equal.Type
open import Data.Equal.sym
open import Data.Equal.trans

-- Left equality property
-- If a is equal to x and b is equal to x, then a is equal to b
-- - x: The common value
-- - a: The first value to compare
-- - b: The second value to compare
-- - r: Proof that a is equal to x
-- - s: Proof that b is equal to x
-- = Proof that a is equal to b
left : ∀ {a} {A : Set a} {x a b : A} → a === x → b === x → a === b
left r s = trans r (sym s)