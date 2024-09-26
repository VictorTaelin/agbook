module Base.Pair.Trait.Eq where

open import Base.Pair.Pair
import Base.Pair.eq as Pair
import Base.Pair.neq as Pair
import Base.Trait.Eq as Eq

instance
  EqPair : ∀ {A B : Set} -> {{EqA : Eq.Eq A}} -> {{EqB : Eq.Eq B}} -> Eq.Eq (Pair A B)
  EqPair {{EqA}} {{EqB}} = record
    { eq = Pair.eq {{EqA}} {{EqB}}
    ; neq = Pair.neq {{EqA}} {{EqB}}
    }
