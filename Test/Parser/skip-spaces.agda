module Test.Parser.skip-spaces where

open import Data.Parser.skip-spaces
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-skip-spaces-some : skip-spaces (MkState "   abc" 0) == Done (MkReply (MkState "abc" 3) 3)
test-skip-spaces-some = refl

test-skip-spaces-none : skip-spaces (MkState "abc" 0) == Done (MkReply (MkState "abc" 0) 0)
test-skip-spaces-none = refl

test-skip-spaces-all : skip-spaces (MkState "     " 0) == Done (MkReply (MkState "" 5) 5)
test-skip-spaces-all = refl