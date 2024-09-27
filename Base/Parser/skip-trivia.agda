module Base.Parser.skip-trivia where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.not
open import Base.Char.Char
open import Base.Char.eq
open import Base.Char.is-space
open import Base.List.List
open import Base.List.drop
open import Base.List.length
open import Base.List.take-while
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Pair.Pair
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.String.from-list
open import Base.String.to-list

-- Checks if a character is a newline
is-newline : Char -> Bool
is-newline c = c == '\n'

-- Checks if a list of characters starts with "//"
is-comment : List Char -> Bool
is-comment ('/' :: '/' :: _) = True
is-comment _                 = False

mutual
  -- Helper function to handle comment skipping
  {-# TERMINATING #-} -- FIXME!
  skip-comment : Nat -> List Char -> Pair Nat (List Char)
  skip-comment acc cs = do
    let com-len = length (take-while (λ c -> not (is-newline c)) cs)
    let new-acc = add (add acc 2) com-len -- +2 for "//"
    let rem     = drop (Succ com-len) cs  -- +1 to consume newline
    skip-trivia-go new-acc rem

  -- Auxiliary function for skip-trivia
  -- Accumulates the number of skipped characters
  {-# TERMINATING #-} -- FIXME!
  skip-trivia-go : Nat -> List Char -> Pair Nat (List Char)
  skip-trivia-go acc []        = acc , []
  skip-trivia-go acc (c :: cs) = 
    if is-space c then
      skip-trivia-go (Succ acc) cs
    else if is-comment (c :: cs) then
      skip-comment acc cs
    else
      (acc , (c :: cs))

-- Skips whitespace and comments in the text.
-- Returns the number of characters skipped.
skip-trivia : Parser Nat
skip-trivia = λ s -> do
  let input       = State.input s
  let chars       = to-list input
  let (skp , rem) = skip-trivia-go Zero chars
  let new-index   = add (State.index s) skp
  let new-input   = from-list rem
  Done (MkReply (MkState new-input new-index) skp)
