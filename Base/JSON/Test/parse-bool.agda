module Base.JSON.Test.parse-bool where

open import Base.JSON.Type
open import Base.JSON.parse-bool
open import Base.Parser.Type
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type
open import Base.Bool.Type

test-parse-bool-true : parse-bool (MkState "true" 0) ≡ Done (MkReply (MkState "" 4) (JBool True))
test-parse-bool-true = refl

test-parse-bool-false : parse-bool (MkState "false" 0) ≡ Done (MkReply (MkState "" 5) (JBool False))
test-parse-bool-false = refl

test-parse-bool-true-whitespace : parse-bool (MkState "  true" 0) ≡ Done (MkReply (MkState "" 6) (JBool True))
test-parse-bool-true-whitespace = refl

test-parse-bool-false-whitespace : parse-bool (MkState " false" 0) ≡ Done (MkReply (MkState "" 6) (JBool False))
test-parse-bool-false-whitespace = refl

test-parse-bool-fail-incomplete : parse-bool (MkState "fal" 0) ≡ Fail (MkError 0 "Expected false")
test-parse-bool-fail-incomplete = refl

test-parse-bool-fail-invalid : parse-bool (MkState "falsy" 0) ≡ Fail (MkError 0 "Expected false")
test-parse-bool-fail-invalid = refl

test-parse-bool-true-trailing : parse-bool (MkState "true123" 0) ≡ Done (MkReply (MkState "123" 4) (JBool True))
test-parse-bool-true-trailing = refl

test-parse-bool-false-trailing : parse-bool (MkState "false456" 0) ≡ Done (MkReply (MkState "456" 5) (JBool False))
test-parse-bool-false-trailing = refl
