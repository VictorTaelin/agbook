module Base.Bool.xnor- where

open import Base.Bool.Bool
open import Base.Bool.xnor 
open import Base.Equal.Equal 

-- Test cases for xnor function
xnorTest1 : xnor True True ≡ True
xnorTest1 = refl

xnorTest2 : xnor True False ≡ False
xnorTest2 = refl

xnorTest3 : xnor False True ≡ False
xnorTest3 = refl

xnorTest4 : xnor False False ≡ True
xnorTest4 = refl

