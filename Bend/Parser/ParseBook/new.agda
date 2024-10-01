module Bend.Parser.ParseBook.new where

open import Bend.Parser.ParseBook.ParseBook
open import Base.BitMap.new renaming (new to map-new)

new : ParseBook
new = MkParseBook map-new map-new map-new
