module Base.BitMap.insert where

open import Base.BitMap.BitMap
open import Base.BitMap.set
open import Base.Bits.Bits
open import Base.Pair.Pair
open import Base.Pair.get-fst
open import Base.Pair.get-snd

-- Inserts a key-value pair into a BitMap.
-- - pair: The key-value pair to insert.
-- - m: The BitMap to insert the key-value pair into.
-- = A new BitMap containing the key-value pair.
insert : ∀ {A : Set} → Pair Bits A → BitMap A → BitMap A
insert pair m = set m (fst pair) (snd pair)
