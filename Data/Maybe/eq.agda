module Data.Maybe.eq where

open import Data.Maybe.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Trait.Eq public

instance
  EqMaybe : ∀ {A : Set} {{EqA : Eq A}} → Eq (Maybe A)
  EqMaybe {{EqA}} = record
    { eq = eq-maybe
    ; neq = neq-maybe
    }
    where
      eq-maybe : Maybe _ → Maybe _ → Bool
      eq-maybe None     None     = True
      eq-maybe (Some x) (Some y) = eq {{EqA}} x y
      eq-maybe _        _        = False

      neq-maybe : Maybe _ → Maybe _ → Bool
      neq-maybe x y = not (eq-maybe x y)

