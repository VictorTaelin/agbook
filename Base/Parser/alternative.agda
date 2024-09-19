module Base.Parser.alternative where

open import Base.Parser.Type
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Result.Type
open import Base.Function.case

-- Alternative operator
_<|>_ : ∀ {A : Set} → Parser A → Parser A → Parser A
(p <|> q) s = case p s of λ where
  (Done r) → Done r
  (Fail _) → q s

infixl 3 _<|>_
