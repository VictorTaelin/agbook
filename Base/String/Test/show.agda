module Base.String.Test.show where

open import Base.String.Type
open import Base.String.show
open import Base.Equal.Type

test-show-non-empty-string : show "hello" === "\"hello\""
test-show-non-empty-string = refl

test-show-empty-string : show "" === "\"\""
test-show-empty-string = refl

test-show-string-with-spaces : show "hello world" === "\"hello world\""
test-show-string-with-spaces = refl

test-show-string-with-special-chars : show "hello\nworld" === "\"hello\\nworld\""
test-show-string-with-special-chars = refl
