module Bend.Parser.consume-exactly where

open import Base.Parser.Parser
open import Base.Parser.consume
open import Base.String.String
open import Base.Unit.Unit

consume-exactly : String → Parser Unit
consume-exactly = consume
