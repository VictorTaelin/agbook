module Base.Int.Test.from-neg where

open import Base.Int.Type
open import Base.Int.from-neg
open import Base.Nat.Type
open import Base.Equal.Type

_ : from-neg Zero ≡ Pos Zero
_ = refl

_ : -2 ≡ NegSuc (Succ Zero)
_ = refl

_ : -2 ≡ from-neg 2
_ = refl

test : (n : Nat) -> (from-neg (Succ n) ≡ NegSuc n)
test p = refl
