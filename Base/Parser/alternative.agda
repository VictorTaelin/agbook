module Base.Parser.alternative where

open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Result.Result
open import Base.Function.case

-- Combines two parsers, trying the second if the first fails.
-- - 1st: The first parser to try.
-- - 2nd: The parser to try if the first fails.
-- = A new parser that succeeds if either of the input parsers succeeds.
alternative : ∀ {A : Set} -> Parser A -> Parser A -> Parser A
alternative p q s = case p s of λ where
  (Done r) -> Done r
  (Fail _) -> q s

-- Infix operator for alternative.
_<|>_ : ∀ {A : Set} -> Parser A -> Parser A -> Parser A
_<|>_ = alternative

infixl 3 _<|>_
