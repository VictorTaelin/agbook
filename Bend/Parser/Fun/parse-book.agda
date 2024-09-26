module Bend.Parser.Fun.parse-book where

open import Base.Bool.if
open import Base.String.hash
open import Base.BitMap.set renaming (set to map-set)
open import Bend.Fun.Term.Term
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.is-eof
open import Bend.Parser.skip-trivia
open import Bend.Parser.Fun.parse-fn-def
open import Bend.Parser.ParseBook.ParseBook
open import Bend.Parser.ParseBook.TopLevel
open import Bend.Parser.ParseBook.new renaming (new to new-book)
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module FnDef = FnDef' Term

parse-book : Parser ParseBook
parse-book = go new-book

  where

  parse-top-level : Parser TopLevel
  parse-top-level = do
    -- TODO: Other top-level definitions
    def <- parse-fn-def
    pure (TopLevel.FunDef def)

  add-top-level : TopLevel -> ParseBook -> Parser ParseBook
  add-top-level (TopLevel.FunDef def) book = do
    -- TODO: Check for repeats
    let defs = ParseBook.fun-defs book
    let defs = map-set defs (hash (FnDef.name def)) def
    pure record book { fun-defs = defs }

  go : ParseBook -> Parser ParseBook
  go book = do
    skip-trivia
    eof <- is-eof
    if eof then
        pure book
      else do
        def <- parse-top-level
        book <- add-top-level def book
        go book
