module Bend.Load.load-book where

open import Base.Function.case
open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.read-file
open import Base.Nat.show
open import Base.String.String
open import Base.String.append
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Result.Result
open import Bend.Fun.Book.Book
open import Bend.Parser.ParseBook.ParseBook
open import Bend.Parser.Fun.parse-book

-- Converts a ParseBook to a Book
-- TODO: This is a temporary hack to get the book to compile.
--       We'll replace this by the actual resolution and import system.
parse-book-to-book : ParseBook → Book
parse-book-to-book pb = record { defs = ParseBook.fun-defs pb }

-- Loads a book from a file
-- - path: The path to the file containing the book
-- = An IO action that results in either a Book or an error message
load-book : String → IO (Result Book String)
load-book path = do
  content <- read-file path
  let parse-result = parse-book (new-parser-state content)
  pure (case parse-result of λ
    { (Done (MkReply _ book)) →
        Done (parse-book-to-book book)
    ; (Fail (MkError idx err)) →
        Fail ("Failed to parse book at index " ++ show idx ++ ":\n  " ++ err)
    })
