module Test.Parser.take-while where
  
open import Data.Parser.take-while
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Char.Type
open import Data.Char.is-alpha
open import Data.Equal.Type

test-take-while-alpha : (take-while is-alpha) (MkState "abcDEF123" 0) === Done (MkReply (MkState "123" 6) "abcDEF")
test-take-while-alpha = refl

test-take-while-empty : (take-while is-alpha) (MkState "" 0) === Done (MkReply (MkState "" 0) "")
test-take-while-empty = refl

test-take-while-no-match : (take-while is-alpha) (MkState "123abc" 0) === Done (MkReply (MkState "123abc" 0) "")
test-take-while-no-match = refl