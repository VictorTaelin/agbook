module Data.Vector.eq where

open import Data.Vector.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Bool.not
open import Data.Trait.Eq public

instance
  EqVector : ∀ {A : Set} {n : Nat} {{EqA : Eq A}} → Eq (Vector A n)
  EqVector {{EqA}} = record
    { eq = eq-vector
    ; neq = neq-vector
    }
    where
      eq-vector : ∀ {n} → Vector _ n → Vector _ n → Bool
      eq-vector []       []       = True
      eq-vector (x :: xs) (y :: ys) = eq {{EqA}} x y && eq-vector xs ys

      neq-vector : ∀ {n} → Vector _ n → Vector _ n → Bool
      neq-vector x y = not (eq-vector x y)