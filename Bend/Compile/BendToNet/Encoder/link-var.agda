
module Bend.Compile.BendToNet.Encoder.link-var where

open import Data.Function.case
open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Pair.Type
open import Data.String.Type
open import Data.String.hash
open import Data.Map.take renaming (take to map-take)
open import Data.Map.set renaming (set to map-set)
open import Bend.Compile.BendToNet.Encoder.Type
open import Bend.Net.link renaming (link to net-link)
open import Bend.Net.Port.Type

link-var : Encoder → String → Port → Maybe Encoder
link-var (MkEncoder net vars lets) name up =
  let (vars , port) = map-take vars (hash name) in
  case port of λ where
    -- Already found the other side of the variable, just link
    (Some port) → do
      net ← net-link net port up
      Some (MkEncoder net vars lets)
    -- First occurence, store in the var map
    None → do
      let vars = map-set vars (hash name) up
      Some (MkEncoder net vars lets)
