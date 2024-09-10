module Data.Pair.show where

open import Data.Pair.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show

instance
  ShowPair : ∀ {A B : Set} {{ShowA : Show A}} {{ShowB : Show B}} → Show (Pair A B)
  ShowPair {{ShowA}} {{ShowB}} = record { toString = showPair }
    where
      showPair : Pair _ _ → String
      showPair (a , b) = "(" ++ show a ++ ", " ++ show b ++ ")"

-- Tests
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Bool.Type
open import Data.Bool.show
open import Data.Equal.Type

_ : show (1 , True) === "(1, true)"
_ = refl