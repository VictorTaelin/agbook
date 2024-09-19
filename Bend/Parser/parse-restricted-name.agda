module Bend.Parser.parse-restricted-name where

open import Data.Char.Type
open import Data.Bool.Type
open import Data.Bool.if
open import Data.String.Type
open import Data.String.to-list
open import Data.String.from-list
open import Data.String.eq
open import Data.String.starts-with
open import Data.String.contains
open import Data.String.append
open import Data.Maybe.Type
open import Data.Unit.Type
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.consume
open import Data.Parser.fail
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.take-while
open import Bend.Parser.is-name-char

-- Parses a restricted name.
-- - kind: The kind of name being parsed (e.g., "Datatype", "Variable").
-- = A parser that returns the parsed name if successful.
parse-restricted-name : String → Parser String
parse-restricted-name kind = do
  name ← take-while is-name-char
  let res = if name == "" then 
              fail ("Expected " ++ kind ++ " name") 
            else if contains "__" name then 
              fail (kind ++ " names are not allowed to contain \"__\".")
            else if starts-with "//" name then 
              fail (kind ++ " names are not allowed to start with \"//\".")
            else 
              pure name
  res
