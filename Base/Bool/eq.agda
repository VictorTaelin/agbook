module Base.Bool.eq where

open import Base.Bool.Type
open import Base.Eq.Trait public

instance
  EqBool : Eq Bool
  EqBool = record
    { eq = eq-bool
    ; neq = neq-bool
    }
    where
      eq-bool : Bool → Bool → Bool
      eq-bool True  True  = True
      eq-bool False False = True
      eq-bool _     _     = False

      neq-bool : Bool → Bool → Bool
      neq-bool True  False = True
      neq-bool False True  = True
      neq-bool _     _     = False