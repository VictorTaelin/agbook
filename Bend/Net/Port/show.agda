
module Bend.Net.Port.show where

open import Bend.Net.Port.Type
open import Bend.Net.Port.to-pair
open import Data.Pair.show
open import Data.Trait.Show public
open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type

instance
  ShowPort : Show Port
  ShowPort = record { to-string = show-port }
    where
      show-port : Port → String
      show-port port = show (to-pair port)
