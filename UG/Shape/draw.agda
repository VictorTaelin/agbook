module UG.Shape.draw where

open import UG.Shape.Type
open import Data.IO.Type
open import Data.Unit.Type

postulate
  draw : Shape → IO Unit
