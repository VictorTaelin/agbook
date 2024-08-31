module Data.Map.show where

open import Data.Map.Main
open import Data.Maybe.Main
open import Data.Tree.Main
open import Data.String.Main
open import Data.String.append

-- Converts a Map to a String representation.
-- - m: The Map to convert.
-- = A String representation of the Map.
show : ∀ {A : Set} → (A → String) → Map A → String
show f (leaf)                  = "_"
show f (node none     lft rgt) = "#[" ++ show f lft ++ " " ++ show f rgt ++ "]"
show f (node (some v) lft rgt) = "#" ++ f v ++ "[" ++ show f lft ++ " " ++ show f rgt ++ "]"

