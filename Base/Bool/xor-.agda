module Base.Bool.xor- where

open import Base.Bool.Bool
open import Base.Bool.xor
open import Base.Equal.Equal

-- Test cases for the 'xor' function
test-xor-true-true : xor True True ≡ False
test-xor-true-true = refl

test-xor-true-false : xor True False ≡ True
test-xor-true-false = refl

test-xor-false-true : xor False True ≡ True
test-xor-false-true = refl

test-xor-false-false : xor False False ≡ False
test-xor-false-false = refl

-- Test cases for the '^' operator
test-^-true-true : (True ^ True) ≡ False
test-^-true-true = refl

test-^-true-false : (True ^ False) ≡ True
test-^-true-false = refl

test-^-false-true : (False ^ True) ≡ True
test-^-false-true = refl

test-^-false-false : (False ^ False) ≡ False
test-^-false-false = refl

-- Test associativity of '^' operator
test-^-associativity : ∀ a b c → ((a ^ b) ^ c) ≡ (a ^ (b ^ c))
test-^-associativity True True True = refl
test-^-associativity True True False = refl
test-^-associativity True False True = refl
test-^-associativity True False False = refl
test-^-associativity False True True = refl
test-^-associativity False True False = refl
test-^-associativity False False True = refl
test-^-associativity False False False = refl

-- Test commutativity of '^' operator
test-^-commutativity : ∀ a b → (a ^ b) ≡ (b ^ a)
test-^-commutativity True True = refl
test-^-commutativity True False = refl
test-^-commutativity False True = refl
test-^-commutativity False False = refl
