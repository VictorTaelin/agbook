module Data.Pair.ord.both where

open import Data.Pair.Type
open import Data.Ordering.Type
open import Data.Trait.Ord public
open import Data.Trait.Ord.default-ord

instance
  OrdPair : ∀ {A B : Set} → {{_ : Ord A}} → {{_ : Ord B}} → Ord (Pair A B)
  OrdPair = default-ord cmp where
    cmp : ∀ {A B : Set} → {{_ : Ord A}} → {{_ : Ord B}} → 
          Pair A B → Pair A B → Ordering
    cmp x y with compare (Pair.fst x) (Pair.fst y)
    cmp x y | EQ with compare (Pair.snd x) (Pair.snd y)
    ...       | EQ = EQ
    ...       | LT = LT
    ...       | GT = GT
    cmp x y | LT = LT
    cmp x y | GT = GT
