module Base.Maybe.show where

open import Base.Maybe.Type
open import Base.String.Type
open import Base.String.append
open import Base.Show.Trait public

instance
  ShowMaybe : ∀ {A : Set} {{ShowA : Show A}} → Show (Maybe A)
  ShowMaybe {{ShowA}} = record { to-string = show-maybe }
    where
      show-maybe : Maybe _ → String
      show-maybe None = "None"
      show-maybe (Some x) = "Some(" ++ to-string{{ShowA}} x ++ ")"

