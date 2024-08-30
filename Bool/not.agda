module Bool.not where

open import Bool.Main

-- Negates a Boolean value.
-- - b: the input Boolean value.
-- = The negation of the input.
not : Bool → Bool
not true  = false
not false = true
