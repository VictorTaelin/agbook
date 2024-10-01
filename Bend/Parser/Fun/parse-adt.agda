module Bend.Parser.Fun.parse-adt where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.get-index
open import Base.Parser.map
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Adt.CtrField
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.skip-trivia
open import Bend.Parser.parse-restricted-name
open import Bend.Parser.sep-by
open import Bend.Parser.list-like
open import Bend.Parser.Fun.parse-type-term
open import Bend.Source.Source
open import Bend.Source.from-file-span
import Base.List.map as List
import Bend.Fun.Type.Type as Type

-- Parses a Fun syntax ADT definition.
-- = The parsed ADT and the list of ADT constructors.
parse-adt : Parser (Pair Adt (List Ctr))
parse-adt = do
  ini-idx <- get-index
  consume "type"
  (nam , vars) <- parse-name-and-vars
  ctrs    <- parse-ctrs nam vars
  end-idx <- get-index
  let src  = from-file-span ini-idx end-idx
  let adt  = MkAdt nam vars (List.map Ctr.name ctrs) src
  pure (adt , ctrs)

  where
    -- Parses the name and type vars part of the ADT definition.
    -- = The ADT name and type variables.
    parse-name-and-vars : Parser (Pair String (List String))
    parse-name-and-vars = do
      has-parens <- try-consume "("
      if has-parens
        then (do
          skip-trivia
          name <- parse-restricted-name "datatype"
          vars <- list-like (parse-restricted-name "type variable") "" ")" "" False 0
          consume "="
          pure (name , vars))
        else do
          name <- parse-restricted-name "datatype"
          vars <- list-like (parse-restricted-name "type variable") "" "=" "" False 0
          pure (name , vars)

    -- Parses a single field in a constructor definition.
    parse-field : Parser CtrField
    parse-field = do
      skip-trivia
      rec <- try-consume "~"
      has-parens <- try-consume "("
      if has-parens
        then (do
          nam <- parse-restricted-name "datatype constructor field"
          has-type <- try-consume ":"
          typ <- if has-type
            then parse-type-term
            else pure Type.Any
          consume ")"
          pure (MkCtrField nam rec typ))
        else do
          nam <- parse-restricted-name "datatype constructor field"
          pure (MkCtrField nam rec Type.Any)

    -- Parses a single constructor in an ADT definition.
    parse-ctr : String → List String → Parser Ctr
    parse-ctr type-name type-vars = do
      -- TODO: Check for repeated field names
      skip-trivia
      has-parens <- try-consume "("
      skip-trivia
      if has-parens
        then (do
          name     <- parse-restricted-name "datatype constructor"
          let name  = type-name ++ "/" ++ name
          fields   <- list-like parse-field "" ")" "" False 0
          let type  = foldr Type.Arr
                            (Type.Ctr type-name (List.map Type.Var type-vars))
                            (List.map CtrField.type fields)
          pure (MkCtr name type fields))
        else do
          name    <- parse-restricted-name "datatype constructor"
          let name = type-name ++ "/" ++ name
          let type = Type.Ctr type-name (List.map Type.Var type-vars)
          pure (MkCtr name type [])

    -- Parses the constructors part of an ADT definition.
    -- - type-name: The name of the ADT being defined.
    -- - type-vars: The type variables of the ADT being defined.
    -- = A list of constructors.
    parse-ctrs : String → List String → Parser (List Ctr)
    parse-ctrs type-name type-vars = do
      -- TODO: Check that only previously defined vars occur in the constructors.
      --       This probably needs to be done later, after we have the full book.
      head <- parse-ctr type-name type-vars
      many <- try-consume "|"
      tail <- if many
        then sep-by (parse-ctr type-name type-vars) "|" 0
        else pure []
      pure (head :: tail)
