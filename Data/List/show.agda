module Data.List.show where

open import Data.List.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show

instance
  ShowList : ∀ {A : Set} {{ShowA : Show A}} → Show (List A)
  ShowList {{ShowA}} = record { toString = showList }
    where
      showList : List _ → String
      showList [] = "[]"
      showList (x :: xs) = "[" ++ show x ++ showRest xs
        where
          showRest : List _ → String
          showRest [] = "]"
          showRest (y :: ys) = ", " ++ show y ++ showRest ys

-- Tests
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Equal.Type

_ : show (1 :: 2 :: 3 :: []) === "[1, 2, 3]"
_ = refl

_ : show [] === "[]"
_ = refl