module Data.Parser.Test.advance-one where

open import Data.Parser.advance-one
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Char.Type
open import Data.Maybe.Type
open import Data.Equal.Type

test-advance-one-non-empty : advance-one (MkState "abc" 0) === Done (MkReply (MkState "bc" 1) (Some 'a'))
test-advance-one-non-empty = refl

test-advance-one-empty : advance-one (MkState "" 0) === Done (MkReply (MkState "" 0) None)
test-advance-one-empty = refl

test-advance-one-special : advance-one (MkState "!@#" 0) === Done (MkReply (MkState "@#" 1) (Some '!'))
test-advance-one-special = refl