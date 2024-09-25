module Base.Parser.Test.bind where

open import Base.Parser.Monad.bind
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.String.replicate
open import Base.Nat.Type
open import Base.Equal.Type
open import Base.Parser.Monad.pure

-- Definir parsers simples para testar
parser1 : Parser Nat
parser1 = λ s -> Done (MkReply s 5)

parser2 : Nat -> Parser String
parser2 n = λ s -> Done (MkReply s (replicate n 'a'))

test-bind : (bind parser1 parser2) (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) "aaaaa")
test-bind = refl

test-bind-operator : (parser1 >>= parser2) (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) "aaaaa")
test-bind-operator = refl

test-seq : (seq parser1 (pure "hello")) (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) "hello")
test-seq = refl

test-seq-operator : (parser1 >> pure "hello") (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) "hello")
test-seq-operator = refl 