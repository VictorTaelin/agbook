module Base.Parser.starts-with- where

open import Base.Parser.starts-with
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Bool.Bool
open import Base.Equal.Equal

test-starts-with-true : (starts-with "hello") (MkState "hello world" 0) ≡ Done (MkReply (MkState "hello world" 0) True)
test-starts-with-true = refl

test-starts-with-false : (starts-with "hello") (MkState "goodbye world" 0) ≡ Done (MkReply (MkState "goodbye world" 0) False)
test-starts-with-false = refl

test-starts-with-empty : (starts-with "") (MkState "any string" 0) ≡ Done (MkReply (MkState "any string" 0) True)
test-starts-with-empty = refl