module Bend.Parser.parse-var-name where

open import Base.Parser.Type
open import Base.String.Type
open import Bend.Parser.parse-restricted-name

-- Parses a variable name.
parse-var-name : Parser String
parse-var-name = parse-restricted-name "variable"
