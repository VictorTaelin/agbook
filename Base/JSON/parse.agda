module Base.JSON.parse where

open import Base.JSON.Type
open import Base.Parser.alternative
open import Base.Parser.Monad.bind
open import Base.Parser.skip-spaces
open import Base.Parser.Type

open import Base.JSON.parse-null
open import Base.JSON.parse-bool
open import Base.JSON.parse-number
open import Base.JSON.parse-string renaming (parse-string to parse-jstring)
open import Base.JSON.parse-array
open import Base.JSON.parse-object

open import Base.String.Type
open import Base.Result.Type
open import Base.Parser.Reply
open import Base.Parser.Error

mutual
  parse-JSON : Parser JSON
  parse-JSON = do
    skip-spaces
    parse-null  <|> parse-bool <|> parse-number <|> parse-jstring <|> parse-array parse-JSON <|> parse-object parse-JSON 

{-# COMPILE JS parse-JSON = undefined #-}

parse-json-string : String -> Result (Reply JSON) Error
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
