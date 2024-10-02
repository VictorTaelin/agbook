module Base.Pair.neq where

open import Base.Pair.Pair
open import Base.Bool.Bool
open import Base.Bool.not
import Base.Pair.eq as Pair
import Base.Trait.Eq as Eq

-- Checks if two pairs are not equal.
-- - 1st: The pair to compare.
-- - 2nd: The pair to compare.
-- = True if the pairs are not equal, False otherwise.
neq : ∀ {A B : Set} → {{EqA : Eq.Eq A}} → {{EqB : Eq.Eq B}} → Pair A B → Pair A B → Bool
neq {{EqA}} {{EqB}} p1 p2 = not (Pair.eq {{EqA}} {{EqB}} p1 p2)

-- Infix operator for pair inequality.
infix 4 _!=_
_!=_ : ∀ {A B : Set} → {{EqA : Eq.Eq A}} → {{EqB : Eq.Eq B}} → Pair A B → Pair A B → Bool
_!=_ = neq