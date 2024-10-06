module Base.Bool.nand- where

open import Base.Bool.Bool
open import Base.Bool.nand
open import Base.Equal.Equal

-- Test cases for nand function
nand-test-1 : nand True True ≡ False
nand-test-1 = refl

nand-test-2 : nand True False ≡ True
nand-test-2 = refl

nand-test-3 : nand False True ≡ True
nand-test-3 = refl

nand-test-4 : nand False False ≡ True
nand-test-4 = refl

