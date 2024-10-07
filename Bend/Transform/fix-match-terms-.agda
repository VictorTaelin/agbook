module Bend.Transform.fix-match-terms- where

open import Base.BitMap.BitMap
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Function.case
open import Base.Function.id
open import Base.List.List
open import Base.List.head
open import Base.Maybe.to-result
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.Result.fold
open import Base.String.String
open import Base.String.append
open import Base.Trait.Show
open import Bend.Fun.Type.Type
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.show
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.get-def
open import Bend.Parser.Fun.parse-book
open import Bend.Parser.ParseBook.ParseBook
open import Bend.Transform.fix-match-terms
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

to-book : ParseBook → Book
to-book (MkParseBook defs adts ctrs) = MkBook defs adts ctrs

test-fix-term : String → String
test-fix-term input = do
  let file = "type List a = (Cons (h: a) ~(t: (List a))) | Nil\nchecked main = " ++ input
  let res = case (parse-book (new-parser-state file)) of λ where
    (Done (MkReply _ book)) → do
      book <- fix-match-terms (to-book book)
      def <- to-result (get-def book "main") "no main"
      rule <- to-result (head (FnDef.rules def)) "no body"
      Done (show (Rule.body rule))
    (Fail (MkError _ err)) → Fail ("Parse failed: " ++ err)
  fold id id res

-- Simple term (no change expected)
_ : (test-fix-term "x") ≡ "x"
_ = refl

-- Lambda (no change expected)
_ : test-fix-term "λx x" ≡ "λx x"
_ = refl

-- Application (no change expected)
_ : test-fix-term "(f x)" ≡ "(f x)"
_ = refl

-- Let binding (no change expected)
_ : test-fix-term "let x = 1; x" ≡ "let x = 1; x"
_ = refl

-- Simple match expression
_ : test-fix-term "match x { List/Cons: x.h; List/Nil: 0 }" ≡ "match x = x { List/Cons x.h x.t: x.h; List/Nil: 0 }"
_ = refl

-- Match expression with binding and var case
_ : test-fix-term "match y = x { List/Cons: y; z: x }" ≡ "match y = x { List/Cons y.h y.t: y; List/Nil: use z = y; x }"
_ = refl

-- Nested match and fold expressions
_ : test-fix-term "match x { List/Cons: fold y = x.t { List/Cons: (+ x.h y.h); List/Nil: x.h }; List/Nil: 0 }"
   ≡ "match x = x { List/Cons x.h x.t: fold y = x.t { List/Cons y.h y.t: (+ x.h y.h); List/Nil: x.h }; List/Nil: 0 }"
_ = refl

-- Match expression in a let binding
_ : test-fix-term "let y = match x { List/Cons: x.h; List/Nil: 0 }; y"
  ≡ "let y = match x = x { List/Cons x.h x.t: x.h; List/Nil: 0 }; y"
_ = refl

-- Match expression as an argument
_ : test-fix-term "(f match y = x { List/Cons: y.h; List/Nil: 0 })"
  ≡ "(f match y = x { List/Cons y.h y.t: y.h; List/Nil: 0 })"
_ = refl

-- Redundant arms
_ : test-fix-term "match x { List/Cons: x.h; List/Nil: 0; _: 1 }"
  ≡ "Redundant variable case in match"
_ = refl

_ : test-fix-term "match x { List/Cons: x.h; List/Nil: 0; List/Nil: 1 }"
  ≡ "Duplicate match arms for constructor List/Nil"
_ = refl

-- Irrefutable match
_ : test-fix-term "match x { y: y }" ≡ "Irrefutable match"
_ = refl

-- Missing match case
_ : test-fix-term "match x { List/Cons: x.h }" ≡ "Non exhaustive match of type List, missing List/Nil case"
_ = refl
