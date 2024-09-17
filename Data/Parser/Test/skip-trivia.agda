module Data.Parser.Test.skip-trivia where

open import Data.Parser.skip-trivia
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-skip-trivia-spaces : skip-trivia (MkState "   abc" 0) === Done (MkReply (MkState "abc" 3) 3)
test-skip-trivia-spaces = refl

test-skip-trivia-comment : skip-trivia (MkState "// This is a comment\nabc" 0) === Done (MkReply (MkState "abc" 21) 21)
test-skip-trivia-comment = refl

test-skip-trivia-mixed : skip-trivia (MkState "  // Comment\n  abc" 0) === Done (MkReply (MkState "abc" 15) 15)
test-skip-trivia-mixed = refl

test-skip-trivia-none : skip-trivia (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) 0)
test-skip-trivia-none = refl

test-skip-trivia-multiple-comments : skip-trivia (MkState "// Comment 1\n// Comment 2\nabc" 0) === Done (MkReply (MkState "abc" 26) 26)
test-skip-trivia-multiple-comments = refl

test-skip-trivia-mixed-whitespace : skip-trivia (MkState " \t \t abc" 0) === Done (MkReply (MkState "abc" 5) 5)
test-skip-trivia-mixed-whitespace = refl

test-skip-trivia-comment-at-end : skip-trivia (MkState "abc // Final comment" 0) === Done (MkReply (MkState "abc // Final comment" 0) 0)
test-skip-trivia-comment-at-end = refl

test-skip-trivia-multiple-newlines : skip-trivia (MkState "\n\n\nabc" 0) === Done (MkReply (MkState "abc" 3) 3)
test-skip-trivia-multiple-newlines = refl

test-skip-trivia-comment-no-newline : skip-trivia (MkState "// Comment without newline" 0) === Done (MkReply (MkState "" 27) 27)
test-skip-trivia-comment-no-newline = refl
