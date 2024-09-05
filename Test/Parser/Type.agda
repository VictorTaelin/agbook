module Test.Parser.Type where

open import Data.Parser.Type
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

-- Definir um parser simples para testar
simple-parser : Parser Nat
simple-parser = λ s → Done (MkReply s 42)

test-parser-type : simple-parser (MkState "abc" 0) == Done (MkReply (MkState "abc" 0) 42)
test-parser-type = refl

-- Definir um parser que falha
failing-parser : Parser Nat
failing-parser = λ s → Fail (MkError (State.index s) "Test error")

test-parser-type-fail : failing-parser (MkState "abc" 0) == Fail (MkError 0 "Test error")
test-parser-type-fail = refl