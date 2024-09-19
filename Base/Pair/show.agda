module Base.Pair.show where

open import Base.Pair.Type
open import Base.String.Type
open import Base.String.append
open import Base.Show.Trait public

instance
  ShowPair : ∀ {A B : Set} {{ShowA : Show A}} {{ShowB : Show B}} → Show (Pair A B)
  ShowPair {{ShowA}} {{ShowB}} = record { to-string = show-pair }
    where
      show-pair : Pair _ _ → String
      show-pair (a , b) = "(" ++ to-string{{ShowA}} a ++ ", " ++ to-string{{ShowB}} b ++ ")"