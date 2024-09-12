module Data.List.eq where

open import Data.List.Type
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Bool.and
open import Data.Bool.not

instance
  EqList : ∀ {A : Set} {{EqA : Eq A}} → Eq (List A)
  EqList {{EqA}} = record
    { eq = eq-list
    ; neq = neq-list
    }
    where
      eq-list : List _ → List _ → Bool
      eq-list []        []        = True
      eq-list (x :: xs) (y :: ys) = eq {{EqA}} x y && eq-list xs ys
      eq-list _         _         = False

      neq-list : List _ → List _ → Bool
      neq-list x y = not (eq-list x y)