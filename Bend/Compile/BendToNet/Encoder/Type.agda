


module Bend.Compile.BendToNet.Encoder.Type where

open import Data.Map.Type
open import Data.List.Type
open import Data.Pair.Type
open import Bend.Fun.Term.Type using (Term)
open import Bend.Fun.Pattern.Type
open import Bend.Net.Type
open import Bend.Net.Port.Type

record Encoder : Set where
  constructor MkEncoder
  field
    net  : Net
    vars : Map Port
    lets : List (Pair Pattern Term)
