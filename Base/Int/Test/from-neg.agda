module Base.Int.Test.from-neg where

open import Base.Int.Int
open import Base.Int.from-neg
open import Base.Nat.Nat
open import Base.Equal.Equal

_ : from-neg Zero ≡ Pos Zero
_ = refl

_ : -2 ≡ NegSuc (Succ Zero)
_ = refl

_ : -2 ≡ from-neg 2
_ = refl

test : (n : Nat) -> (from-neg (Succ n) ≡ NegSuc n)
test p = refl
