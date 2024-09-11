module Bend.Compile.BendToNet.book-to-nets where

open import Data.Function.case
open import Data.List.Type
open import Data.List.foldr
open import Data.List.head
open import Data.List.map
open import Data.List.unzip
open import Data.Map.to-list renaming (to-list to map-to-list)
open import Data.Maybe.Type
open import Data.Pair.Type
open import Data.Result.Type
open import Data.Result.bind
open import Data.String.Type using (String)
open import Data.String.append
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
book-to-nets : Book → Result (List (Pair String Net)) String
book-to-nets book =
  let (_ , defs) = unzip (map-to-list (Book.defs book)) in
  foldr
    (λ def nets → do
      net ← def-to-net def
      nets ← nets
      (Done (net :: nets) )
    )
    (Done [])
    defs
  where

  term-to-net : Term → Result Net String
  term-to-net term = do
    enc ← encode-term new-encoder term net-root
    Done (Encoder.net enc)

  def-to-net' : FnDef → Result Net String
  def-to-net' (MkFnDef name type check rules src) = do
    body ← case head rules of λ where
      (Some rule) → Done (Rule.body rule)
      None → Fail ("No rules found for " ++ name)
    term-to-net body

  def-to-net : FnDef → Result (Pair String Net) String
  def-to-net def = do
      net ← def-to-net' def
      let name = FnDef.name def
      Done (name , net)
