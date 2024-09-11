module Data.JSON.parse where

open import Data.JSON.Type
open import Data.Parser.alternative
open import Data.Parser.bind
open import Data.Parser.skip-spaces
open import Data.Parser.Type

open import Data.JSON.parse-null
open import Data.JSON.parse-bool
open import Data.JSON.parse-number
open import Data.JSON.parse-string renaming (parse-string to parse-jstring)
open import Data.JSON.parse-array
open import Data.JSON.parse-object

open import Data.String.Type
open import Data.Result.Type
open import Data.Parser.Reply
open import Data.Parser.Error

mutual
  parse-JSON : Parser JSON
  parse-JSON = do
    skip-spaces
    parse-null  <|> parse-bool <|> parse-number <|> parse-jstring <|> parse-array parse-JSON <|> parse-object parse-JSON 

{-# COMPILE JS parse-JSON = undefined #-}

parse-json-string : String → Result (Reply JSON) Error
parse-json-string input = 
  parse-JSON (record { input = input ; index = 0 })

{-# COMPILE JS parse-json-string = function(input) {
  try {
    const parsed = JSON.parse(input);
    return { tag: 'Done', contents: { state: { input: input, index: input.length }, value: parsed } };
  } catch (error) {
    return { tag: 'Fail', contents: { index: 0, error: error.message } };
  }
} #-}
