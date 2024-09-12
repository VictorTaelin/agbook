module Data.Pair.eq where

open import Data.Pair.Type
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Bool.not
open import Data.Trait.Eq public

instance
  EqPair : ∀ {A B : Set} {{EqA : Eq A}} {{EqB : Eq B}} → Eq (Pair A B)
  EqPair {{EqA}} {{EqB}} = record
    { eq = eq-pair
    ; neq = neq-pair
    }
    where
      eq-pair : Pair _ _ → Pair _ _ → Bool
      eq-pair (x1 , y1) (x2 , y2) = eq {{EqA}} x1 x2 && eq {{EqB}} y1 y2

      neq-pair : Pair _ _ → Pair _ _ → Bool
      neq-pair x y = not (eq-pair x y)

