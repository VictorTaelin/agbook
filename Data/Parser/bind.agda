module Data.Parser.bind where

open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Result.Type
open import Data.Function.case using (case_of_)

-- Binds two parsers together
bind : ∀ {A B : Set} → Parser A → (A → Parser B) → Parser B
bind p f s = case p s of λ where
  (Done r) → f (Reply.value r) (Reply.state r)
  (Fail e) → Fail e

-- Sequencing of parsers, discarding the result of the first parser
seq : ∀ {A B : Set} → Parser A → Parser B → Parser B
seq p q = bind p (λ _ → q)

_>>=_ : ∀ {A B : Set} → Parser A → (A → Parser B) → Parser B
_>>=_ = bind

_>>_ : ∀ {A B : Set} → Parser A → Parser B → Parser B
_>>_ = seq

infixl 1 _>>=_ _>>_
