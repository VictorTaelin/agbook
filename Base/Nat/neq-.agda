module Base.Nat.neq- where

open import Base.Nat.Nat
open import Base.Nat.neq
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test cases for neq function

-- Test : Different numbers should return True.
T0 : (0 != 1) ≡ True
T0 = refl

-- Test : Same numbers should return False.
T1 : (2 != 2) ≡ False
T1 = refl

-- Test : Zero and a non-zero number should return True.
T2 : (0 != 3) ≡ True
T2 = refl

-- Test : Different non-zero numbers should return True.
T3 : (4 != 5) ≡ True
T3 = refl

-- Test : Zero and itself should return False.
T4 : (0 != 0) ≡ False
T4 = refl

-- Test : Larger numbers should work correctly.
T5 : (10 != 11) ≡ True
T5 = refl

-- Test : Larger same numbers should return False.
T6 : (100 != 100) ≡ False
T6 = refl

