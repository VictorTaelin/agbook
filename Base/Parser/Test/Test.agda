module Base.Parser.Test.Test where

open import Base.Parser.Parser
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

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