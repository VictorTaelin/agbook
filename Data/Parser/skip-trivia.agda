module Data.Parser.skip-trivia where

open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.not
open import Data.Char.Type
open import Data.Char.eq
open import Data.Class.Eq
open import Data.Char.is-space
open import Data.List.Type
open import Data.List.drop
open import Data.List.length
open import Data.List.take-while
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Pair.Type
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.String.from-list
open import Data.String.to-list

-- Checks if a character is a newline
is-newline : Char → Bool
is-newline c = c == '\n'

-- Checks if a list of characters starts with "//"
is-comment : List Char → Bool
is-comment ('/' :: '/' :: _) = True
is-comment _                 = False

mutual
  -- Helper function to handle comment skipping
  skip-comment : Nat → List Char → Pair Nat (List Char)
  skip-comment acc cs = do
    let comment-length = length (take-while (λ c → not (is-newline c)) cs)
    let new-acc        = add (add acc 2) comment-length -- +2 for "//"
    let remaining      = drop (Succ comment-length) cs  -- +1 to consume newline
    skip-trivia-go new-acc remaining

  -- Auxiliary function for skip-trivia
  -- Accumulates the number of skipped characters
  skip-trivia-go : Nat → List Char → Pair Nat (List Char)
  skip-trivia-go acc []        = acc , []
  skip-trivia-go acc (c :: cs) = 
    if is-space c
    then skip-trivia-go (Succ acc) cs
    else (if is-comment (c :: cs)
         then skip-comment acc cs
         else (acc , (c :: cs)))

-- Skips whitespace and comments in the text.
-- Returns the number of characters skipped.
skip-trivia : Parser Nat
skip-trivia = λ s → do
  let input              = State.input s
  let chars              = to-list input
  let (skipped , remain) = skip-trivia-go Zero chars
  let new-index          = add (State.index s) skipped
  let new-input          = from-list remain
  Done (MkReply (MkState new-input new-index) skipped)
