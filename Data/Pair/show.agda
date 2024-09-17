module Data.Pair.show where

open import Data.Pair.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show public

instance
  ShowPair : ∀ {A B : Set} {{ShowA : Show A}} {{ShowB : Show B}} → Show (Pair A B)
  ShowPair {{ShowA}} {{ShowB}} = record { to-string = show-pair }
    where
      show-pair : Pair _ _ → String
      show-pair (a , b) = "(" ++ to-string{{ShowA}} a ++ ", " ++ to-string{{ShowB}} b ++ ")"