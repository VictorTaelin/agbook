module Data.Maybe.eq where

open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Trait.Eq

instance
  EqMaybe : ∀ {A : Set} {{EqA : Eq A}} → Eq (Maybe A)
  EqMaybe {{EqA}} = record
    { _≡_ = eq-maybe
    ; _≠_ = neq-maybe
    }
    where
      eq-maybe : Maybe _ → Maybe _ → Bool
      eq-maybe None     None     = True
      eq-maybe (Some x) (Some y) = _≡_ {{EqA}} x y
      eq-maybe _        _        = False

      neq-maybe : Maybe _ → Maybe _ → Bool
      neq-maybe x y = not (eq-maybe x y)

-- Testes
_ : (Some 3 == Some 3) === True
_ = refl

_ : (Some 2 == Some 3) === False
_ = refl

_ : (None == Some 4) === False
_ = refl