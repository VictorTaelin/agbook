module Bend.Compile.BendToNet.Encoder.link-var where

open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.hash
open import Base.BinMap.take
open import Base.BinMap.set
open import Bend.Compile.BendToNet.Encoder.Encoder
open import Bend.Net.link
open import Bend.Net.Port.Port

-- Adds one of the ports of a Bend variable to the Encoder.
-- If the variable has already been seen, links the port to the other side.
-- If the variable has not been seen, stores the port in the var map.
-- - encoder: The current Encoder state
-- - name: The name of the variable
-- - up: The port to link the variable to
-- = An updated Encoder or None on error
link-var : Encoder → String → Port → Maybe Encoder
link-var (MkEncoder net vars) name up =
  case take vars (hash name) of λ where
    (Some (vars , port)) → do
      net <- link net port up
      Some (MkEncoder net vars)
    None → do
      let vars = set vars (hash name) up
      Some (MkEncoder net vars)

