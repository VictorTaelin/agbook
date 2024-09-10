module Data.Vector.show where

open import Data.Vector.Type
open import Data.Nat.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show

instance
  ShowVector : ∀ {A : Set} {n : Nat} {{ShowA : Show A}} → Show (Vector A n)
  ShowVector {{ShowA}} = record { toString = showVector }
    where
      showVector : ∀ {n} → Vector _ n → String
      showVector [] = "[]"
      showVector (x :: xs) = "<" ++ show x ++ showRest xs
        where
          showRest : ∀ {n} → Vector _ n → String
          showRest [] = ">"
          showRest (y :: ys) = ", " ++ show y ++ showRest ys

-- Tests
open import Data.Nat.show
open import Data.Equal.Type

_ : show (1 :: 2 :: 3 :: []) === "<1, 2, 3>"
_ = refl

_ : show [] === "[]"
_ = refl