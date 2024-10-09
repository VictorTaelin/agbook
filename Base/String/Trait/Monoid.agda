module Base.String.Trait.Monoid where

open import Base.String.String
open import Base.String.append
open import Base.Trait.Monoid

instance
  MonoidString : Monoid String
  MonoidString = record
    { memp = ""
    ; mapp = append
    }

