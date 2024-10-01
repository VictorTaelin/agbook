module Base.Parser.Error- where

open import Base.Parser.Error
open import Base.Pair.Pair
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

test-error-fields : let e = MkError 5 "Test error" in (Error.index e , Error.error e) ≡ (5 , "Test error")
test-error-fields = refl