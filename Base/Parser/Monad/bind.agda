module Base.Parser.Monad.bind where

open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Result.Result
open import Base.Function.case

-- Binds two parsers together
-- - p: The first parser
-- - f: A function that takes the result of the first parser and returns a new parser
-- = A new parser that combines the results of both parsers
bind : ∀ {A B : Set} → Parser A → (A → Parser B) → Parser B
bind p f s = case p s of λ where
  (Done r) → f (Reply.value r) (Reply.state r)
  (Fail e) → Fail e

-- Infix operator for bind
_>>=_ : ∀ {A B : Set} → Parser A → (A → Parser B) → Parser B
_>>=_ = bind

infixl 1 _>>=_

-- Sequencing of parsers, discarding the result of the first parser
-- - p: The first parser (result discarded)
-- - q: The second parser
-- = A new parser that runs both parsers in sequence, returning the result of the second
seq : ∀ {A B : Set} → Parser A → Parser B → Parser B
seq p q = p >>= λ _ → q

-- Infix operator for seq
_>>_ : ∀ {A B : Set} → Parser A → Parser B → Parser B
_>>_ = seq

infixl 1 _>>_

