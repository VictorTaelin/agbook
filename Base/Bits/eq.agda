module Base.Bits.eq where

open import Base.Bits.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Eq.Trait public

instance
  EqBits : Eq Bits
  EqBits = record
    { eq = eq-bits
    ; neq = neq-bits
    }
    where
      eq-bits : Bits → Bits → Bool
      eq-bits E E = True
      eq-bits (O x) (O y) = eq-bits x y
      eq-bits (I x) (I y) = eq-bits x y
      eq-bits _ _ = False

      neq-bits : Bits → Bits → Bool
      neq-bits x y = not (eq-bits x y)