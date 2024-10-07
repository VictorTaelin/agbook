module Base.Bool.or- where

open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Equal.Equal

T0 : (True || True) ≡ True
T0 = refl

T1 : (True || False) ≡ True
T1 = refl

T2 : (False || False) ≡ False
T2 = refl

