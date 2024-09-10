module Test.Parser.bind where

open import Data.Parser.bind
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.String.replicate
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Parser.pure

-- Definir parsers simples para testar
parser1 : Parser Nat
parser1 = λ s → Done (MkReply s 5)

parser2 : Nat → Parser String
parser2 n = λ s → Done (MkReply s (replicate n 'a'))

test-bind : (bind parser1 parser2) (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) "aaaaa")
test-bind = refl

test-bind-operator : (parser1 >>= parser2) (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) "aaaaa")
test-bind-operator = refl

test-seq : (seq parser1 (pure "hello")) (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) "hello")
test-seq = refl

test-seq-operator : (parser1 >> pure "hello") (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) "hello")
test-seq-operator = refl 