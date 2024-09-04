module Test.Parser.peek-one where

open import Data.Parser.peek-one
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Char.Type
open import Data.Maybe.Type
open import Data.Equal.Type

test-peek-one-non-empty : peek-one (MkState "abc" 0) == Done (MkReply (MkState "abc" 0) (Some 'a'))
test-peek-one-non-empty = refl

test-peek-one-empty : peek-one (MkState "" 0) == Done (MkReply (MkState "" 0) None)
test-peek-one-empty = refl

test-peek-one-special : peek-one (MkState "!@#" 0) == Done (MkReply (MkState "!@#" 0) (Some '!'))
test-peek-one-special = refl