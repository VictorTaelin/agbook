module Data.List.reverse where

open import Data.List.Type
open import Data.List.foldl

-- Reverses a list.
reverse : ∀ {A : Set} → List A → List A
reverse = foldl (λ{xs x → x :: xs}) []
