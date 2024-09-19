module Base.List.is-asc where

open import Base.Bool.Type
open import Base.Bool.and
open import Base.List.Type
open import Base.List.foldr
open import Base.Nat.Type
open import Base.Nat.Ord
open import Base.Ord.Trait

-- Checks if a list of Nats is in ascending order.
-- - xs: The list of Nats to check.
-- = True if the list is in ascending order, False otherwise.
is-asc : List Nat -> Bool
is-asc []        = True
is-asc (x :: xs) = foldr (λ x acc l -> _<=_ {{OrdNat}} l x && acc x) (λ x -> True) xs 0
