module Bend.Parser.ParseBook.new where

open import Bend.Parser.ParseBook.Type
open import Base.Map.new renaming (new to map-new)

new : ParseBook
new = MkParseBook map-new
