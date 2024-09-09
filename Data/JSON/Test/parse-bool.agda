module Data.JSON.Test.parse-bool where

open import Data.JSON.Type
open import Data.JSON.parse-bool
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Bool.Type

test-parse-bool-true : parse-bool (MkState "true" 0) == Done (MkReply (MkState "" 4) (JBool True))
test-parse-bool-true = refl

test-parse-bool-false : parse-bool (MkState "false" 0) == Done (MkReply (MkState "" 5) (JBool False))
test-parse-bool-false = refl

test-parse-bool-true-whitespace : parse-bool (MkState "  true" 0) == Done (MkReply (MkState "" 6) (JBool True))
test-parse-bool-true-whitespace = refl

test-parse-bool-false-whitespace : parse-bool (MkState " false" 0) == Done (MkReply (MkState "" 6) (JBool False))
test-parse-bool-false-whitespace = refl

test-parse-bool-fail-incomplete : parse-bool (MkState "fal" 0) == Fail (MkError 0 "Expected false")
test-parse-bool-fail-incomplete = refl

test-parse-bool-fail-invalid : parse-bool (MkState "falsy" 0) == Fail (MkError 0 "Expected false")
test-parse-bool-fail-invalid = refl

test-parse-bool-true-trailing : parse-bool (MkState "true123" 0) == Done (MkReply (MkState "123" 4) (JBool True))
test-parse-bool-true-trailing = refl

test-parse-bool-false-trailing : parse-bool (MkState "false456" 0) == Done (MkReply (MkState "456" 5) (JBool False))
test-parse-bool-false-trailing = refl
