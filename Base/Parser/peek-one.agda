module Base.Parser.peek-one where

open import Base.Char.Type
open import Base.Maybe.Type
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.head

-- Peeks at the next character in the input without consuming it.
-- - 1st: The current parser state.
-- = A Reply containing the current state and the next character (if any).
peek-one : Parser (Maybe Char)
peek-one = λ s -> Done (MkReply s (head (State.input s)))
