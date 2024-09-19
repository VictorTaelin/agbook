module Bend.Parser.consume-exactly where

open import Data.Parser.Type
open import Data.Parser.consume
open import Data.String.Type
open import Data.Unit.Type

consume-exactly : String → Parser Unit
consume-exactly = consume
