module Base.Pair.ord.both where

open import Base.Pair.Type
open import Base.Ordering.Type
open import Base.Ord.Trait public
open import Base.Ord.default-ord

instance
  OrdPairBoth : ∀ {A B : Set} → {{_ : Ord A}} → {{_ : Ord B}} → Ord (Pair A B)
  OrdPairBoth = default-ord cmp where
    cmp : ∀ {A B : Set} → {{_ : Ord A}} → {{_ : Ord B}} → Pair A B → Pair A B → Ordering
    cmp (a₁ , a₂) (b₁ , b₂) with compare a₁ b₁
    cmp (a₁ , a₂) (b₁ , b₂) | EQ = compare a₂ b₂
    cmp _         _         | res = res
