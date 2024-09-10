module Data.Maybe.show where

open import Data.Maybe.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show
open import Data.Equal.Type
open import Data.Nat.Type
open import Data.Nat.show

instance
  ShowMaybe : ∀ {A : Set} {{ShowA : Show A}} → Show (Maybe A)
  ShowMaybe {{ShowA}} = record { toString = showMaybe }
    where
      showMaybe : Maybe _ → String
      showMaybe None = "None"
      showMaybe (Some x) = "Some(" ++ toString{{ShowA}} x ++ ")"

-- Tests
_ : show None === "None"
_ = refl

_ : show (Some 1) === "Some(1)"
_ = refl
