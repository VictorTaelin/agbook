module Data.JSON.parse-array where

open import Data.JSON.Type
open import Data.List.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.consume
open import Data.Parser.pure
open import Data.Parser.skip-spaces
open import Data.Parser.alternative

parse-elements : Parser JSON → Parser (List JSON)
parse-elements parseJSON = 
  (parse-non-empty parseJSON) <|> (pure [])
  where
    parse-non-empty : Parser JSON → Parser (List JSON)
    parse-non-empty pJSON = do
      skip-spaces
      first ← pJSON
      skip-spaces
      (parse-rest first) <|> (pure (first :: []))
      where
        parse-rest : JSON → Parser (List JSON)
        parse-rest f = do
          consume ","
          rest ← parse-elements pJSON
          pure (f :: rest)

parse-array : Parser JSON → Parser JSON
parse-array parseJSON = do
  skip-spaces
  consume "["
  elements ← parse-elements parseJSON
  skip-spaces
  consume "]"
  pure (JArray elements)


