module Bend.Parser.Fun.parse-book where

open import Base.BitMap.union
open import Base.Bool.if
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair
open import Base.String.hash
open import Bend.Fun.Adt.Adt
open import Bend.Fun.Adt.Ctr
open import Bend.Fun.Term.Term
import Base.BitMap.set as BitMap
import Bend.Fun.FnDef.FnDef as FnDef'

open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.fail
open import Base.Parser.is-eof
open import Base.Parser.map
open import Base.Parser.starts-with

open import Bend.Parser.first-with-guard
open import Bend.Parser.skip-trivia
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.Fun.parse-fn-def
open import Bend.Parser.Fun.parse-adt
open import Bend.Parser.ParseBook.ParseBook
open import Bend.Parser.ParseBook.TopLevel
open import Bend.Parser.ParseBook.new renaming (new to new-book)

private
  open module FnDef = FnDef' Term

-- Parses a complete book of definitions.
-- Parses top-level definitions until the end of the input is reached.
-- = A new ParseBook with the parsed definitions.
parse-book : Parser ParseBook
parse-book = go new-book

  where

  -- Parses a single top-level definition.
  parse-top-level : Parser TopLevel
  parse-top-level = do
    -- TODO: Other top-level definitions
    first-with-guard (
         (starts-with-keyword "type"   , (map TopLevel.TypeDef parse-adt))
      :: (starts-with-keyword "object" , (fail "not implemented"))
      :: (starts-with-keyword "hvm"    , (fail "not implemented"))
      :: [] )                            (map TopLevel.FunDef parse-fn-def)
    def <- parse-fn-def
    pure (TopLevel.FunDef def)

  -- Adds a parsed top-level definition to the book.
  -- Updates the right fields in the book based on the type of the definition.
  -- - def: The parsed top-level definition.
  -- - book: The current ParseBook.
  -- = A new ParseBook with the top-level definition added.
  add-top-level : TopLevel → ParseBook → Parser ParseBook

  add-top-level (TopLevel.FunDef def) book = do
    -- TODO: Check for repeats
    let defs = BitMap.set (ParseBook.fun-defs book) (hash (FnDef.name def)) def
    pure record book { fun-defs = defs }

  add-top-level (TopLevel.TypeDef (adt , ctrs)) book = do
    let adts = BitMap.set (ParseBook.adts book) (hash (Adt.name adt)) adt
    let ctrs = foldr (λ ctr acc → BitMap.set acc (hash (Ctr.name ctr)) ctr)
                    (ParseBook.ctrs book) ctrs
    pure record book { adts = adts ; ctrs = ctrs }

  -- Helper function to iteratively build the ParseBook.
  go : ParseBook → Parser ParseBook
  go book = do
    skip-trivia
    eof <- is-eof
    if eof
      then (do
        pure book)
      else (do
        def <- parse-top-level
        book <- add-top-level def book
        go book)
