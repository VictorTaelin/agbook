module Bend.Parser.parse-top-level-name where

open import Base.String.String
open import Base.Parser.Parser
open import Bend.Parser.parse-name

-- Parses a top-level definition name.
parse-top-level-name : Parser String
parse-top-level-name = parse-name "top-level"
