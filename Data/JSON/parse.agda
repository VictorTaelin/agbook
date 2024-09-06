module Data.JSON.parse where

open import Data.Bool.Type
open import Data.Char.is-digit
open import Data.Float.from-string
open import Data.Function.case
open import Data.JSON.Type
open import Data.List.Type
open import Data.Maybe.Type
open import Data.Pair.Type
open import Data.Parser.alternative
open import Data.Parser.bind
open import Data.Parser.consume
open import Data.Parser.fail
open import Data.Parser.parse-char
open import Data.Parser.parse-string
open import Data.Parser.pure
open import Data.Parser.skip-spaces
open import Data.Parser.take-while
open import Data.Parser.Type
open import Data.String.append
open import Data.String.Type

parseNull : Parser JSON
parseNull = do
  skip-spaces
  consume "null"
  pure JNull

parseBool : Parser JSON
parseBool = do
  skip-spaces
  b <- (consume "true" >> pure True) <|> (consume "false" >> pure False)
  pure (JBool b)

parseNumber : Parser JSON
parseNumber = do
  skip-spaces
  sign <- (consume "-" >> pure "-") <|> pure ""
  intPart <- take-while is-digit
  fracPart <- (do
    consume "."
    frac <- take-while is-digit
    pure ("." ++ frac)) <|> pure ""
  expPart <- (do
    _ <- consume "e" <|> consume "E"
    expSign <- (consume "+" >> pure "+") <|> (consume "-" >> pure "-") <|> pure ""
    exp <- take-while is-digit
    pure ("e" ++ expSign ++ exp)) <|> pure ""

  let numStr = sign ++ intPart ++ fracPart ++ expPart
  case from-string numStr of λ where
    (Some n) → pure (JNumber n)
    None → fail ("Invalid number: " ++ numStr)

parseString : Parser JSON
parseString = do
  skip-spaces
  str <- parse-string
  pure (JString str)

mutual
  parseJSON : Parser JSON
  parseJSON = do
    skip-spaces
    parseNull <|> parseBool <|> parseNumber <|> parseString <|> parseArray <|> parseObject

  parseArray : Parser JSON
  parseArray = do
    skip-spaces
    consume "["
    elements <- parseElements
    skip-spaces
    consume "]"
    pure (JArray elements)
    where
      parseElements : Parser (List JSON)
      parseElements = parseJSON >>= λ first →
        (do
          skip-spaces
          consume ","
          rest <- parseElements
          pure (first :: rest))
        <|> pure (first :: [])
        <|> pure []

  parseObject : Parser JSON
  parseObject = do
    skip-spaces
    consume "{"
    pairs <- parsePairs
    skip-spaces
    consume "}"
    pure (JObject pairs)
    where
      parsePair : Parser (Pair String JSON)
      parsePair = do
        skip-spaces
        key <- parse-string
        skip-spaces
        consume ":"
        value <- parseJSON
        pure (key , value)

      parsePairs : Parser (List (Pair String JSON))
      parsePairs = parsePair >>= λ first →
        (do
          skip-spaces
          consume ","
          rest <- parsePairs
          pure (first :: rest))
        <|> pure (first :: [])
        <|> pure []
