module Data.Maybe.show where

open import Data.Maybe.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show public

instance
  ShowMaybe : ∀ {A : Set} {{ShowA : Show A}} → Show (Maybe A)
  ShowMaybe {{ShowA}} = record { to-string = show-maybe }
    where
      show-maybe : Maybe _ → String
      show-maybe None = "None"
      show-maybe (Some x) = "Some(" ++ to-string{{ShowA}} x ++ ")"

