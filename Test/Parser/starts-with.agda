module Test.Parser.starts-with where

open import Data.Parser.starts-with
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Bool.Type
open import Data.Equal.Type

test-starts-with-true : (starts-with "hello") (MkState "hello world" 0) === Done (MkReply (MkState "hello world" 0) True)
test-starts-with-true = refl

test-starts-with-false : (starts-with "hello") (MkState "goodbye world" 0) === Done (MkReply (MkState "goodbye world" 0) False)
test-starts-with-false = refl

test-starts-with-empty : (starts-with "") (MkState "any string" 0) === Done (MkReply (MkState "any string" 0) True)
test-starts-with-empty = refl