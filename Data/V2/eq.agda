module Data.V2.eq where

open import Data.V2.Type
open import Data.Float.Type
open import Data.Float.eq
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Bool.not
open import Data.Trait.Eq

instance
  EqV2 : Eq V2
  EqV2 = record
    { eq = eq-v2
    ; neq = neq-v2
    }
    where
      eq-v2 : V2 → V2 → Bool
      eq-v2 (MkV2 x1 y1) (MkV2 x2 y2) = (x1 == x2) && (y1 == y2)

      neq-v2 : V2 → V2 → Bool
      neq-v2 v1 v2 = not (eq-v2 v1 v2)