module Bend.Parser.Fun.parse-book- where

open import Base.Equal.Equal
open import Base.Function.case
open import Base.String.append
open import Base.String.String
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Bend.Parser.Fun.parse-book
open import Bend.Parser.ParseBook.ParseBook
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.show
open import Base.Trait.Show

-- Helper function to run the parser and show the result
parse-and-show : String → String
parse-and-show input =
  case parse-book (MkState input 0) of λ where
    (Done (MkReply _ book)) → show (MkBook (ParseBook.fun-defs book) (ParseBook.adts book) (ParseBook.ctrs book))
    (Fail (MkError _ err)) → "Parse failed: " ++ err

-- Empty input
_ : parse-and-show "" ≡ ""
_ = refl

-- Single function definition
_ : parse-and-show "main = 42" ≡ "unchecked main : Any\n(main) = 42"
_ = refl

-- Multiple function definitions
_ : parse-and-show
  "foo = 1\nbar = 2"
  ≡
  "unchecked bar : Any\n(bar) = 2\n\nunchecked foo : Any\n(foo) = 1"
_ = refl


-- Error
_ : parse-and-show "a" ≡ "Parse failed: Expected pattern"
_ = refl

_ : parse-and-show "'foo = 1\nbar = 2\n" ≡ "Parse failed: Expected top-level definition"
_ = refl

