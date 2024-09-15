module Data.Parser.Test.peek-many where

open import Data.Parser.peek-many
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-peek-many-some : (peek-many 3) (MkState "abcdef" 0) === Done (MkReply (MkState "abcdef" 0) (Some "abc"))
test-peek-many-some = refl

test-peek-many-all : (peek-many 6) (MkState "abcdef" 0) === Done (MkReply (MkState "abcdef" 0) (Some "abcdef"))
test-peek-many-all = refl

test-peek-many-too-many : (peek-many 10) (MkState "abcdef" 0) === Done (MkReply (MkState "abcdef" 0) None)
test-peek-many-too-many = refl

test-peek-many-empty : (peek-many 3) (MkState "" 0) === Done (MkReply (MkState "" 0) None)
test-peek-many-empty = refl