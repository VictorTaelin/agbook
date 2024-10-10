module Bend.Compile.BendToNet.book-to-nets where

open import Base.Function.case
open import Base.List.List
open import Base.List.head
open import Base.List.unzip
open import Base.List.mmap
open import Base.BinMap.to-list renaming (to-list to map-to-list)
open import Base.Maybe.to-result
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.String.append
open import Bend.Compile.BendToNet.Encoder.new renaming (new to new-encoder)
open import Bend.Compile.BendToNet.Encoder.encode-term
open import Bend.Compile.BendToNet.Encoder.Encoder
open import Bend.Fun.Book.Book using (Book)
open import Bend.Fun.Term.Term using (Term)
open import Bend.Net.Net using (Net)
open import Bend.Net.net-root
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

-- Converts all definitions in a book to a list of flat nets
-- - book: The Book containing function definitions
-- = A List of Nets with the compiled definitions or an error message
book-to-nets : Book → Result (List Net) String
book-to-nets book = do
  -- TODO: HVM native functions
  let (_ , defs) = unzip (map-to-list (Book.defs book))
  mmap def-to-net defs
  where

  -- Converts a single function definition to a Net
  -- - def: The FnDef (function definition) to convert
  -- = The function compiled to a Net or an error message
  def-to-net : FnDef → Result Net String
  def-to-net (MkFnDef name type check rules src) = do
    rule <- to-result (head rules) ("No rules found for " ++ name)
    enc  <- encode-term (new-encoder name) (Rule.body rule) net-root
    Done (Encoder.net enc)

