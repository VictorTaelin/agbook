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

-- Adds one of the ports of a Bend variable to the Encoder.
-- If the variable has already been seen, links the port to the other side.
-- If the variable has not been seen, stores the port in the var map.
-- - encoder: The current Encoder state
-- - name: The name of the variable
-- - up: The port to link the variable to
-- = An updated Encoder or None on error
link-var : Encoder → String → Port → Maybe Encoder
link-var (MkEncoder net vars lets) name up =
  let (vars , port) = map-take vars (hash name) in
  case port of λ where
    (Some port) → do
      net ← net-link net port up
      Some (MkEncoder net vars lets)
    None → do
      let vars = map-set vars (hash name) up
      Some (MkEncoder net vars lets)
