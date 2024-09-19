
module Bend.Net.Port.show where

open import Bend.Net.Port.Type
open import Bend.Net.Port.to-pair
open import Base.Pair.show
open import Base.Trait.Show public
open import Base.Nat.Type
open import Base.Nat.show
open import Base.String.Type

instance
  ShowPort : Show Port
  ShowPort = record { to-string = show-port }
    where
      show-port : Port → String
      show-port port = show (to-pair port)
