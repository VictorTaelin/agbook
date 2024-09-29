module Base.Pair.Trait.Eq where

open import Base.Pair.Pair
import Base.Pair.eq as Pair
import Base.Pair.neq as Pair
open import Base.Trait.Eq

instance
  EqPair : ∀ {A B : Set} {{EqA : Eq A}} {{EqB : Eq B}} → Eq (Pair A B)
  EqPair = MkEq Pair.eq Pair.neq
