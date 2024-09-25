module Base.Parser.parse-many where

open import Base.Function.case
open import Base.List.reverse
open import Base.List.Type
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type

-- Parses as many occurrences of the given parser as possible
-- Returns a list of all successfully parsed elements
parse-many : ∀ {A : Set} -> Parser A -> Parser (List A)
parse-many p = parse-many-go p []
  where

  -- Helper function to accumulate parsed results
  parse-many-go : ∀ {A : Set} -> Parser A -> List A -> Parser (List A)
  parse-many-go p acc s =
    case p s of λ where
      (Done r) -> parse-many-go p (Reply.value r :: acc) (Reply.state r)
      (Fail _) -> Done (MkReply s (reverse acc))
