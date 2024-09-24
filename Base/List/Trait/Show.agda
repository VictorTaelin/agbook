module Base.List.Trait.Show where

open import Base.List.Type
import Base.List.show as List
import Base.Trait.Show as Show

instance
  ShowList : ∀ {A : Set} {{ShowA : Show.Show A}} -> Show.Show (List A)
  ShowList {{ShowA}} = record { to-string = List.show }
