module Base.String.show where

open import Base.String.Type
open import Base.Show.Trait public

instance
  ShowString : Show String
  ShowString = record { to-string = show-string }
    where
      show-string : String → String
      show-string = primShowString