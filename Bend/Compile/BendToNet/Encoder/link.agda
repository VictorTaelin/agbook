module Bend.Compile.BendToNet.Encoder.link where

open import Data.Maybe.Type
open import Data.Maybe.bind
open import Bend.Compile.BendToNet.Encoder.Type
open import Bend.Net.link renaming (link to net-link)
open import Bend.Net.Port.Type

link : Encoder → Port → Port → Maybe Encoder
link enc a b = do
  let net = Encoder.net enc
  net ← net-link net a b
  Some (record enc { net = net })
