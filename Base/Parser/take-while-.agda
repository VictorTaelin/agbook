module Base.Parser.take-while- where
  
open import Base.Parser.take-while
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Char.Char
open import Base.Char.is-alpha
open import Base.Equal.Equal

test-take-while-alpha : (take-while is-alpha) (MkState "abcDEF123" 0) ≡ Done (MkReply (MkState "123" 6) "abcDEF")
test-take-while-alpha = refl

test-take-while-empty : (take-while is-alpha) (MkState "" 0) ≡ Done (MkReply (MkState "" 0) "")
test-take-while-empty = refl

test-take-while-no-match : (take-while is-alpha) (MkState "123abc" 0) ≡ Done (MkReply (MkState "123abc" 0) "")
test-take-while-no-match = refl