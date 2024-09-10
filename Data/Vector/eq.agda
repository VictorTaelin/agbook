module Data.Vector.eq where

open import Data.Vector.Type
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Class.Eq

instance
  EqVector : ∀ {A : Set} {n : Nat} {{EqA : Eq A}} → Eq (Vector A n)
  EqVector {{EqA}} = record
    { _≡_ = eq-vector
    ; _≠_ = neq-vector
    }
    where
      eq-vector : ∀ {n} → Vector _ n → Vector _ n → Bool
      eq-vector []       []       = True
      eq-vector (x :: xs) (y :: ys) = _≡_ {{EqA}} x y && eq-vector xs ys

      neq-vector : ∀ {n} → Vector _ n → Vector _ n → Bool
      neq-vector x y = not (eq-vector x y)

-- Testes
_ : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 3 :: [])) === True
_ = refl

_ : ((1 :: 2 :: []) == (1 :: 3 :: [])) === False
_ = refl