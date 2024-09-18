module Base.List.eq where

open import Base.List.Type
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Bool.not
open import Base.Trait.Eq public

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