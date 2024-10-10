module Base.List.is-asc where

open import Base.Bool.Bool
open import Base.Bool.and
open import Base.List.List
open import Base.List.foldr
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.Trait.Ord

-- Checks if a list of Nats is in ascending order.
-- - xs: The list of Nats to check.
-- = True if the list is in ascending order, False otherwise.
is-asc : List Nat → Bool
is-asc []        = True
is-asc (x :: xs) = foldr (λ x acc l → _<=_ {{OrdNat}} l x && acc x) (λ x → True) xs 0

