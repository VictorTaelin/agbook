module Bend.Parser.parse-top-level-name where

open import Base.String.Type
open import Base.Parser.Type
open import Bend.Parser.parse-restricted-name

-- Parses a top-level definition name.
parse-top-level-name : Parser String
parse-top-level-name = parse-restricted-name "top-level"
