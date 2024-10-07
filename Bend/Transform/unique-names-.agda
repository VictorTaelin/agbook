module Bend.Transform.unique-names- where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.List.List
open import Base.List.eq
open import Base.String.String
open import Base.String.eq
open import Base.Result.Result
open import Base.Equal.Equal
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.BinMap.BitMap
open import Base.BinMap.empty
open import Base.Pair.Pair
open import Base.Trait.Show
open import Bend.Parser.Fun.parse-term
open import Bend.Transform.unique-names
open import Bend.Fun.Num.Num
open import Bend.Fun.Type.Type
open import Bend.Fun.Term.Term renaming (Num to Num')
open import Bend.Fun.Term.show
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.new

parse : String → Result (Reply Term) Error
parse input = parse-term (new-parser-state input)

test-unique-names : String → String
test-unique-names input =
  case parse input of λ where
    (Done (MkReply _ parsed-term)) → do
      let (result , _) = unique-names-term 0 empty parsed-term
      show result
    _ → ""

-- Simple variable reference (no change expected)
_ : (test-unique-names "x") ≡ "x"
_ = refl

-- Lambda with single use of variable (should be renamed)
_ : test-unique-names "λx x" ≡ "λa a"
_ = refl

-- Lambda with multiple uses of variable (should be renamed consistently)
_ : test-unique-names "λx (x x)" ≡ "λa (a a)"
_ = refl

-- Let binding with single use (should be renamed)
_ : test-unique-names "let x = 1; x" ≡ "let a = 1; a"
_ = refl

-- Let binding with multiple uses (should be renamed consistently)
_ : test-unique-names "let x = 1; (x x)" ≡ "let a = 1; (a a)"
_ = refl

-- Nested lambdas with multiple uses (should be renamed uniquely)
_ : test-unique-names "λx λy (x y x)" ≡ "λa λb (a b a)"
_ = refl

-- Multiple let bindings (should be renamed uniquely)
_ : test-unique-names "let x = 1; let y = 2; (x y)" ≡ "let a = 1; let b = 2; (a b)"
_ = refl

-- Unused variable should still be renamed
_ : test-unique-names "let x = 1; 2" ≡ "let a = 1; 2"
_ = refl

-- Complex expression with multiple variables and uses
_ : test-unique-names "λx λy let z = x; (x y z x)" ≡ "λa λb let c = a; (a b c a)"
_ = refl

-- Pattern matching
_ : test-unique-names "λ{x,{y,z}} (x,y,z)" ≡ "λ{a {b c}} (a, b, c)"
_ = refl

-- Switch with shadowing
_ : test-unique-names "λx λy switch x { 0: y; _: x }" ≡ "λa λb switch c = a { 0: b; _ d: c }"
_ = refl
