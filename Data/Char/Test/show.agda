module Data.Char.Test.show where

open import Data.Char.Type
open import Data.Char.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type

-- Show tests
_ : show 'a' === "'a'"
_ = refl

_ : show '0' === "'0'"
_ = refl

_ : show '\n' === "'\n'"
_ = refl

_ : show ' ' === "' '"
_ = refl
