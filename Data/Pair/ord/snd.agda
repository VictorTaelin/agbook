module Data.Pair.ord.snd where

open import Data.Pair.Type
open import Data.Ordering.Type
open import Data.Trait.Ord public
open import Data.Trait.Ord.default-ord

instance
  OrdPairSnd : ∀ {A B : Set} → {{_ : Ord B}} → Ord (Pair A B)
  OrdPairSnd = default-ord λ x y → compare (Pair.snd x) (Pair.snd y)
