module Base.Pair.ord.fst where

open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Ordering.Type
open import Base.Ord.Trait public
open import Base.Ord.default-ord

instance
  OrdPairFst : ∀ {A B : Set} → {{_ : Ord A}} → Ord (Pair A B)
  OrdPairFst = default-ord λ x y → compare (get-fst x) (get-fst y)
