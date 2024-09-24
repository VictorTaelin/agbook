module Bend.Parser.consume-exactly where

open import Base.Parser.Type
open import Base.Parser.consume
open import Base.String.Type
open import Base.Unit.Type

consume-exactly : String -> Parser Unit
consume-exactly = consume
