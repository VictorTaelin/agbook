module Data.List.unzip where

open import Data.List.Type
open import Data.List.unzip-with
open import Data.Pair.Type

-- Unzips a list of pairs into two different lists.
unzip : ∀ {A B : Set} → List (Pair A B) → Pair (List A) (List B)
unzip = unzip-with λ{x → x}
