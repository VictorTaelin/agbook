module Data.Bits.eq where

open import Data.Bits.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Class.Eq
open import Data.Equal.Type

instance
  EqBits : Eq Bits
  EqBits = record
    { _≡_ = eq-bits
    ; _≠_ = neq-bits
    }
    where
      eq-bits : Bits → Bits → Bool
      eq-bits E E = True
      eq-bits (O x) (O y) = eq-bits x y
      eq-bits (I x) (I y) = eq-bits x y
      eq-bits _ _ = False

      neq-bits : Bits → Bits → Bool
      neq-bits x y = not (eq-bits x y)

-- Testes
_ : (O (I E) == O (I E)) === True
_ = refl

_ : (I E == O E) === False
_ = refl

_ : (I (O E) != I (O E)) === False
_ = refl
