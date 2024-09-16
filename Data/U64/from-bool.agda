module Data.U64.from-bool where

open import Data.Bool.Type
open import Data.U64.Type 

from-bool : Bool → U64
from-bool True  = primWord64FromNat 1
from-bool False = primWord64FromNat 0
