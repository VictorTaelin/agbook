module Data.Pair.ord.fst where

open import Data.Pair.Type
open import Data.Ordering.Type
open import Data.Trait.Ord public
open import Data.Trait.Ord.default-ord

instance
  OrdPair : ∀ {A B : Set} → {{_ : Ord A}} → Ord (Pair A B)
  OrdPair = default-ord λ x y → compare (Pair.fst x) (Pair.fst y)
