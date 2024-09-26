module Base.Char.Test.show where

open import Base.Char.Char
open import Base.Char.show
open import Base.String.String
open import Base.Equal.Equal

test-show-a : show 'a' ≡ "'a'"
test-show-a = refl

test-show-0 : show '0' ≡ "'0'"
test-show-0 = refl

test-show-new-line : show '\n' ≡ "'\n'"
test-show-new-line = refl

test-show-space : show ' ' ≡ "' '"
test-show-space = refl
