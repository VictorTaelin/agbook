module Data.List.eq where

open import Data.List.Type
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Equal.Type
open import Data.Class.Eq
open import Data.Bool.and
open import Data.Bool.not

instance
  EqList : ∀ {A : Set} {{EqA : Eq A}} → Eq (List A)
  EqList {{EqA}} = record
    { _≡_ = eq-list
    ; _≠_ = neq-list
    }
    where
      eq-list : List _ → List _ → Bool
      eq-list []        []        = True
      eq-list (x :: xs) (y :: ys) = _≡_ {{EqA}} x y && eq-list xs ys
      eq-list _         _         = False

      neq-list : List _ → List _ → Bool
      neq-list x y = not (eq-list x y)

-- Testes
_ : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 3 :: [])) === True
_ = refl

_ : ((1 :: 2 :: []) == (1 :: 2 :: 3 :: [])) === False
_ = refl

_ : ((True :: False :: []) != (True :: True :: [])) === True
_ = refl
