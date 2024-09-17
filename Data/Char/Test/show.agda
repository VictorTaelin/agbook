module Data.Char.Test.show where

open import Data.Char.Type
open import Data.Char.show
open import Data.String.Type
open import Data.Equal.Type

test-show-a : show 'a' === "'a'"
test-show-a = refl

test-show-0 : show '0' === "'0'"
test-show-0 = refl

test-show-new-line : show '\n' === "'\n'"
test-show-new-line = refl

test-show-space : show ' ' === "' '"
test-show-space = refl
