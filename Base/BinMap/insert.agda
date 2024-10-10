module Base.BinMap.insert where

open import Base.BinMap.BinMap
open import Base.BinMap.set
open import Base.Bits.Bits
open import Base.Pair.Pair
open import Base.Pair.get-fst
open import Base.Pair.get-snd

-- Inserts a key-value pair into a BinMap.
-- - pair: The key-value pair to insert.
-- - m: The BinMap to insert the key-value pair into.
-- = A new BinMap containing the key-value pair.
insert : ∀ {A : Set} → Pair Bits A → BinMap A → BinMap A
insert pair m = set m (fst pair) (snd pair)

