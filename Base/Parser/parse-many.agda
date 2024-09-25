module Base.Parser.parse-many where

open import Base.Function.case
open import Base.List.Type
open import Base.List.reverse
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type

-- Parses as many occurrences of the given parser as possible.
-- - 1st: The parser to be repeatedly applied.
-- = A parser that returns a list of all successfully parsed elements.
parse-many : ∀ {A : Set} -> Parser A -> Parser (List A)
parse-many p = parse-many-go p []
  where

  -- Helper function to accumulate parsed results.
  -- - 1st: The parser to be repeatedly applied.
  -- - 2nd: The accumulator list of already parsed elements.
  -- = A parser that returns the final list of all parsed elements.
  parse-many-go : ∀ {A : Set} -> Parser A -> List A -> Parser (List A)
  parse-many-go p acc s =
    case p s of λ where
      (Done r) -> parse-many-go p (Reply.value r :: acc) (Reply.state r)
      (Fail _) -> Done (MkReply s (reverse acc))