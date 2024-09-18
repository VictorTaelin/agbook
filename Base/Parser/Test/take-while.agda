module Base.Parser.Test.take-while where
  
open import Base.Parser.take-while
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Char.Type
open import Base.Char.is-alpha
open import Base.Equal.Type

test-take-while-alpha : (take-while is-alpha) (MkState "abcDEF123" 0) === Done (MkReply (MkState "123" 6) "abcDEF")
test-take-while-alpha = refl

test-take-while-empty : (take-while is-alpha) (MkState "" 0) === Done (MkReply (MkState "" 0) "")
test-take-while-empty = refl

test-take-while-no-match : (take-while is-alpha) (MkState "123abc" 0) === Done (MkReply (MkState "123abc" 0) "")
test-take-while-no-match = refl