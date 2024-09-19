module Base.Pair.eq where

open import Base.Pair.Type
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Trait.Eq.default-eq
open import Base.Trait.Eq public

instance
  EqPair : ∀ {A B : Set} {{EqA : Eq A}} {{EqB : Eq B}} → Eq (Pair A B)
  EqPair = default-eq λ where
    (a₁ , a₂) (b₁ , b₂) → (a₁ == b₁) && (a₂ == b₂)
