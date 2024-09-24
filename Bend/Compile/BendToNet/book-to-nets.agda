module Bend.Compile.BendToNet.book-to-nets where

open import Base.Function.case
open import Base.List.Type
open import Base.List.head
open import Base.List.unzip
open import Base.BitMap.to-list renaming (to-list to map-to-list)
open import Base.Maybe.to-result
open import Base.Pair.Type
open import Base.Result.Type
open import Base.Result.Monad.bind
open import Base.String.Type
open import Base.String.append
open import Bend.Compile.BendToNet.Encoder.new renaming (new to new-encoder)
open import Bend.Compile.BendToNet.Encoder.encode-term
open import Bend.Compile.BendToNet.Encoder.Type
open import Bend.Fun.Book.Type using (Book)
open import Bend.Fun.Term.Type using (Term)
open import Bend.Net.Type using (Net)
open import Bend.Net.net-root
import Bend.Fun.FnDef.Type as FnDef'
import Bend.Fun.Rule.Type as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

-- Converts all definitions in a book to a list of flat nets
-- - book: The Book containing function definitions
-- = A List of Nets with the compiled definitions or an error message
book-to-nets : Book -> Result (List Net) String
book-to-nets book =
  let (_ , defs) = unzip (map-to-list (Book.defs book)) in
  defs-to-nets defs
  where

  -- Converts a single function definition to a Net
  -- - def: The FnDef (function definition) to convert
  -- = The function compiled to a Net or an error message
  def-to-net : FnDef -> Result Net String
  def-to-net (MkFnDef name type check rules src) = do
      rule <- to-result (head rules) ("No rules found for " ++ name)
      enc <- encode-term (new-encoder name) (Rule.body rule) net-root
      Done (Encoder.net enc)

  -- Recursively processes a list of function definitions into Nets
  -- - defs: The list of FnDef (function definitions) to process
  -- = A List of compiled Nets or an error message
  -- TODO: This could just be a foldM
  defs-to-nets : List FnDef -> Result (List Net) String
  defs-to-nets [] = Done []
  defs-to-nets (def :: defs) = do
    net <- def-to-net def
    nets <- defs-to-nets defs
    (Done (net :: nets))
