module Bend.Parser.parse-var-name where

open import Base.Parser.Parser
open import Base.String.String
open import Bend.Parser.parse-name

-- Parses a variable name.
parse-var-name : Parser String
parse-var-name = parse-name "variable"

