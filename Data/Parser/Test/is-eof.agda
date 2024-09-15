module Data.Parser.Test.is-eof where

open import Data.Parser.is-eof
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Bool.Type
open import Data.Equal.Type

test-is-eof-true : is-eof (MkState "" 0) === Done (MkReply (MkState "" 0) True)
test-is-eof-true = refl

test-is-eof-false : is-eof (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) False)
test-is-eof-false = refl

