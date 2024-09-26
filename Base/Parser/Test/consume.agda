module Base.Parser.Test.consume where
  
open import Base.Parser.consume
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Unit.Unit
open import Base.Equal.Equal

test-consume-valid : (consume "abc") (MkState "abcdef" 0) ≡ Done (MkReply (MkState "def" 3) unit)
test-consume-valid = refl

test-consume-invalid : (consume "abc") (MkState "abxdef" 0) ≡ Fail (MkError 0 "Expected abc")
test-consume-invalid = refl

test-consume-empty : (consume "") (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) unit)
test-consume-empty = refl