module Base.Parser.Test.Type where

open import Base.Parser.Type
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type

-- Definir um parser simples para testar
simple-parser : Parser Nat
simple-parser = λ s -> Done (MkReply s 42)

test-parser-type : simple-parser (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) 42)
test-parser-type = refl

-- Definir um parser que falha
failing-parser : Parser Nat
failing-parser = λ s -> Fail (MkError (State.index s) "Test error")

test-parser-type-fail : failing-parser (MkState "abc" 0) ≡ Fail (MkError 0 "Test error")
test-parser-type-fail = refl