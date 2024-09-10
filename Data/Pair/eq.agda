module Data.Pair.eq where

open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Pair.Type
open import Data.Char.Type
open import Data.Char.eq
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Class.Eq

instance
  EqPair : ∀ {A B : Set} {{EqA : Eq A}} {{EqB : Eq B}} → Eq (Pair A B)
  EqPair {{EqA}} {{EqB}} = record
    { _≡_ = eq-pair
    ; _≠_ = neq-pair
    }
    where
      eq-pair : Pair _ _ → Pair _ _ → Bool
      eq-pair (x1 , y1) (x2 , y2) = _≡_ {{EqA}} x1 x2 && _≡_ {{EqB}} y1 y2

      neq-pair : Pair _ _ → Pair _ _ → Bool
      neq-pair x y = not (eq-pair x y)

-- Testes
_ : ((1 , 'a') == (1 , 'a')) === True
_ = refl

_ : ((1 , 'a') == (2 , 'a')) === False
_ = refl