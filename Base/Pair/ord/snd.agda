module Base.Pair.ord.snd where

open import Base.Pair.Type
open import Base.Pair.get-snd
open import Base.Ordering.Type
open import Base.Ord.Trait public
open import Base.Ord.default-ord

instance
  OrdPairSnd : ∀ {A B : Set} → {{_ : Ord B}} → Ord (Pair A B)
  OrdPairSnd = default-ord λ x y → compare (get-snd x) (get-snd y)
