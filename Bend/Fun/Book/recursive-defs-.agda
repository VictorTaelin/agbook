module Bend.Fun.Book.recursive-defs- where

open import Base.BinMap.BinMap
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Function.case
open import Base.Function.id
open import Base.List.List
open import Base.List.sort
open import Base.Maybe.to-result
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.Result.fold
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import Base.String.lte
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.recursive-defs
open import Bend.Parser.Fun.parse-book
open import Bend.Parser.ParseBook.ParseBook
open import Bend.Transform.resolve-refs

to-book : ParseBook → Book
to-book (MkParseBook defs adts ctrs) = MkBook defs adts ctrs

test-recursive-defs : String → String
test-recursive-defs input = do
  case (parse-book (new-parser-state input)) of λ where
    (Done (MkReply _ book)) → do
      let book = to-book book
      let book = resolve-refs book
      join " " (sort lte (recursive-defs book))
    (Fail (MkError _ err)) → "Parse failed: " ++ err

-- No recursive functions
_ : test-recursive-defs "f x = x\ng y = y" ≡ ""
_ = refl

-- Single recursive function
_ : test-recursive-defs "fact n = switch n { 0: 1; _: (* n (fact n-1)) }" ≡ "fact"
_ = refl

-- Mutually recursive functions
_ : test-recursive-defs "
  even n = switch n { 0: True;  _: (odd  (n-1)) }
  odd  n = switch n { 0: False; _: (even (n-1)) }" ≡  "even odd"
_ = refl

-- Multiple functions, some recursive
_ : test-recursive-defs "
  f x = (g x)
  g z = (+ z 1)
  h y = (h y)
  i w = (i (i w))" ≡ "h i"
_ = refl

-- Indirect recursion
_ : test-recursive-defs "
  a x = (b x)
  b y = (c y)
  c z = (a z)" ≡ "a b c"
_ = refl

-- Two cycles with the same function
_ : test-recursive-defs "
  a = (b c)
  b = a
  c = a" ≡ "a b c"
_ = refl
