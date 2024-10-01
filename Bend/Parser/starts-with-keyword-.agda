module Bend.Parser.starts-with-keyword- where

open import Base.Parser.Parser
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Error
open import Bend.Parser.starts-with-keyword
open import Base.Function.case
open import Base.Equal.Equal
open import Base.String.String
open import Base.Maybe.Maybe
open import Base.Result.Result
open import Base.List.List
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Bool.Bool

parse : String → String → Result (Reply Bool) Error
parse keyword input = starts-with-keyword keyword (MkState input 0)

ok : String → Nat → Bool → Result (Reply Bool) Error
ok input index expected = Done (MkReply (MkState input index) expected)

-- Keyword at the start, followed by space
_ : parse "let" "let x = 5" ≡ ok "let x = 5" 0 True
_ = refl

-- Keyword at the start, followed by newline
_ : parse "if" "if\nx > 5" ≡ ok "if\nx > 5" 0 True
_ = refl

-- Keyword at the start, followed by punctuation
_ : parse "match" "match(x)" ≡ ok "match(x)" 0 True
_ = refl

-- Keyword not at the start
_ : parse "let" "x let y = 5" ≡ ok "x let y = 5" 0 False
_ = refl

-- Keyword is a prefix of the input, but not followed by non-name char
_ : parse "let" "letter" ≡ ok "letter" 0 False
_ = refl

-- Keyword at the start, but it's the entire input
_ : parse "if" "if" ≡ ok "if" 0 True
_ = refl

-- Empty keyword (edge case)
_ : parse "" "(non-char)" ≡ ok "(non-char)" 0 True
_ = refl

-- Keyword longer than input
_ : parse "longkeyword" "short" ≡ ok "short" 0 False
_ = refl

-- Unicode keyword (shouldn't be used for non-name chars, but still works)
_ : parse "λ" "λ x.x" ≡ ok "λ x.x" 0 True
_ = refl

-- Keyword with spaces (possible, but not recommended)
_ : parse "data type" "data type Foo" ≡ ok "data type Foo" 0 True
_ = refl
