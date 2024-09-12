module Data.Parser.alternative where

open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Result.Type
open import Data.Function.case

-- Alternative operator
_<|>_ : ∀ {A : Set} → Parser A → Parser A → Parser A
(p <|> q) s = case p s of λ where
  (Done r) → Done r
  (Fail _) → q s

infixl 3 _<|>_
