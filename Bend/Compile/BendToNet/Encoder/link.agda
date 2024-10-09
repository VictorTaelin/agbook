module Bend.Compile.BendToNet.Encoder.link where

open import Base.Maybe.Maybe
open import Base.Maybe.Monad.bind
open import Bend.Compile.BendToNet.Encoder.Encoder
open import Bend.Net.link renaming (link to net-link)
open import Bend.Net.Port.Port

-- Links two ports in the Encoder's net
-- - enc: The current Encoder state
-- - a: The first Port to link
-- - b: The second Port to link
-- = The Encoder with the net updated or None on error
link : Encoder → Port → Port → Maybe Encoder
link enc a b = do
  let net = Encoder.net enc
  net <- net-link net a b
  Some (record enc { net = net })

