module Base.Parser.map where

open import Base.Parser.Parser
open import Base.Parser.Reply
open import Base.Result.Result
open import Base.Function.case

-- Applies a function to the result of a parser if it succeeds.
-- - fn: The function to apply to the parsed value.
-- - p: The parser to run.
-- = A new parser that applies fn to the result of p if it succeeds.
map : ∀ {A B : Set} → (A → B) → Parser A → Parser B
map fn p = λ s → case p s of λ where
  (Done r) → Done (MkReply (Reply.state r) (fn (Reply.value r)))
  (Fail e) → Fail e

