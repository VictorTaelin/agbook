module Data.String.Test.show where

open import Data.String.Type
open import Data.String.show
open import Data.Equal.Type

test-show-non-empty-string : show "hello" === "\"hello\""
test-show-non-empty-string = refl

test-show-empty-string : show "" === "\"\""
test-show-empty-string = refl

test-show-string-with-spaces : show "hello world" === "\"hello world\""
test-show-string-with-spaces = refl

test-show-string-with-special-chars : show "hello\nworld" === "\"hello\\nworld\""
test-show-string-with-special-chars = refl
