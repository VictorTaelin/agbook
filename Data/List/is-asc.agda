module Data.List.is-asc where

open import Data.Bool.Type
open import Data.Bool.and
open import Data.List.Type
open import Data.List.foldr
open import Data.Nat.Type
open import Data.Nat.lte

-- Checks if a list of Nats is in ascending order.
-- - xs: The list of Nats to check.
-- = True if the list is in ascending order, False otherwise.
is-asc : List Nat -> Bool
is-asc []        = True
is-asc (x :: xs) = foldr (λ x acc l -> l <= x && acc x) (λ x -> True) xs 0
