module Base.Bool.nor- where

open import Base.Bool.Bool
open import Base.Bool.nor
open import Base.Equal.Equal

-- Test cases for nor function
nor-test-1 : nor True True ≡ False
nor-test-1 = refl

nor-test-2 : nor True False ≡ False
nor-test-2 = refl

nor-test-3 : nor False True ≡ False
nor-test-3 = refl

nor-test-4 : nor False False ≡ True
nor-test-4 = refl

