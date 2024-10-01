module Base.Parser.is-eof- where

open import Base.Parser.is-eof
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Bool.Bool
open import Base.Equal.Equal

test-is-eof-true : is-eof (MkState "" 0) ≡ Done (MkReply (MkState "" 0) True)
test-is-eof-true = refl

test-is-eof-false : is-eof (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) False)
test-is-eof-false = refl

