module Data.Vector.show where

open import Data.Vector.Type
open import Data.Nat.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show public

instance
  ShowVector : ∀ {A : Set} {n : Nat} {{ShowA : Show A}} → Show (Vector A n)
  ShowVector {{ShowA}} = record { to-string = show-vector }
    where
      show-vector : ∀ {n} → Vector _ n → String
      show-vector [] = "<>"
      show-vector (x :: xs) = "<" ++ to-string{{ShowA}} x ++ show-rest xs
        where
          show-rest : ∀ {n} → Vector _ n → String
          show-rest [] = ">"
          show-rest (y :: ys) = ", " ++ to-string{{ShowA}} y ++ show-rest ys
