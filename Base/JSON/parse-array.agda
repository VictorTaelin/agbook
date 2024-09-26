module Base.JSON.parse-array where

open import Base.JSON.JSON
open import Base.List.List
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.consume
open import Base.Parser.Monad.pure
open import Base.Parser.skip-spaces
open import Base.Parser.alternative

parse-elements : Parser JSON -> Parser (List JSON)
parse-elements parseJSON = 
  (parse-non-empty parseJSON) <|> (pure [])
  where
    parse-non-empty : Parser JSON -> Parser (List JSON)
    parse-non-empty pJSON = do
      skip-spaces
      first <- pJSON
      skip-spaces
      (parse-rest first) <|> (pure (first :: []))
      where
        parse-rest : JSON -> Parser (List JSON)
        parse-rest f = do
          consume ","
          rest <- parse-elements pJSON
          pure (f :: rest)

parse-array : Parser JSON -> Parser JSON
parse-array parseJSON = do
  skip-spaces
  consume "["
  elements <- parse-elements parseJSON
  skip-spaces
  consume "]"
  pure (JArray elements)


