module Test.Parser.consume where
  
open import Data.Parser.consume
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Unit.Type
open import Data.Equal.Type

test-consume-valid : (consume "abc") (MkState "abcdef" 0) == Done (MkReply (MkState "def" 3) unit)
test-consume-valid = refl

test-consume-invalid : (consume "abc") (MkState "abxdef" 0) == Fail (MkError 0 "Expected abc")
test-consume-invalid = refl

test-consume-empty : (consume "") (MkState "abcdef" 0) == Done (MkReply (MkState "abcdef" 0) unit)
test-consume-empty = refl