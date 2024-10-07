module Bend.Transform.encode-match-terms- where

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
open import Bend.Transform.desugar-use
open import Bend.Transform.encode-match-terms
open import Bend.Transform.fix-match-terms
open import Bend.Transform.rebuild-match-ctrs
open import Bend.Run.AdtEncoding
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

to-book : ParseBook → Book
to-book (MkParseBook defs adts ctrs) = MkBook defs adts ctrs

test : AdtEncoding → String → String
test encoding input = do
  let file = "type List a = (Cons (h: a) ~(t: (List a))) | Nil\nchecked main = " ++ input
  let res = case (parse-book (new-parser-state file)) of λ where
    (Done (MkReply _ book)) → do
      let book = to-book book
      book <- fix-match-terms book
      book <- rebuild-match-ctrs book
      let book = desugar-use book
      book <- encode-match-terms encoding book
      def  <- to-result (get-def book "main") "no main"
      rule <- to-result (head (FnDef.rules def)) "no body"
      Done (show (Rule.body rule))
    (Fail (MkError _ err)) → Fail ("Parse failed: " ++ err)
  fold id id res

-- Simple term (no change expected)
_ : (test Scott "x") ≡ "x"
_ = refl

-- Lambda (no change expected)
_ : test Scott "λx x" ≡ "λx x"
_ = refl

-- Application (no change expected)
_ : test Scott "(f x)" ≡ "(f x)"
_ = refl

-- Let binding (no change expected)
_ : test Scott "let x = 1; x" ≡ "let x = 1; x"
_ = refl

-- Simple match expression (Scott encoding)
_ : test Scott "match x { List/Cons: x.h; List/Nil: 0 }"
  ≡ "(x λx.h λx.t x.h 0)"
_ = refl

-- Simple match expression (NumScott encoding)
_ : test NumScott "match x { List/Cons: x.h; List/Nil: 0 }"
  ≡ "(x λ%tag switch * = %tag { 0: λx.h λx.t x.h; _ *: 0 })"
_ = refl

-- Match expression with binding and var case (Scott encoding)
_ : test Scott "match y = x { List/Cons: y.h; z: y }"
  ≡ "(x λy.h λy.t y.h List/Nil)"
_ = refl

-- Match expression with binding and var case (NumScott encoding)
_ : test NumScott "match y = x { List/Cons: y.h; z: y }"
  ≡ "(x λ%tag switch * = %tag { 0: λy.h λy.t y.h; _ *: List/Nil })"
_ = refl

-- Nested match expressions (Scott encoding)
_ : test Scott "match x { List/Cons: match x.t { List/Cons: (+ x.h x.t.h); List/Nil: x.h }; List/Nil: 0 }"
  ≡ "(x λx.h λx.t (x.t λx.t.h λx.t.t (+ x.h x.t.h) x.h) 0)"
_ = refl

-- Nested match expressions (NumScott encoding)
_ : test NumScott "match x { List/Cons: match x.t { List/Cons: (+ x.h x.t.h); List/Nil: x.h }; List/Nil: 0 }"
  ≡ "(x λ%tag switch * = %tag { 0: λx.h λx.t (x.t λ%tag switch * = %tag { 0: λx.t.h λx.t.t (+ x.h x.t.h); _ *: x.h }); _ *: 0 })"
_ = refl

-- Switch expression (encoding doesn't matter)
_ : test Scott "switch x { 0: A; 1: B; _: C }"
  ≡ "switch * = x { 0: A; _ *: λ%x switch * = %x { 0: B; _ *: λx-2 C } }"
_ = refl

-- Switch expression (NumScott encoding - should remain unchanged)
_ : test NumScott "switch x { 0: A; 1: B; _: C }"
  ≡ "switch * = x { 0: A; _ *: λ%x switch * = %x { 0: B; _ *: λx-2 C } }"
_ = refl
