module Base.Maybe.eq where

open import Base.Maybe.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Trait.Eq public

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

