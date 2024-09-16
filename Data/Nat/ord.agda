module Data.Nat.ord where

open import Data.Nat.Type
open import Data.Trait.Ord public

import Data.Nat.lt as N
import Data.Nat.lte as N
import Data.Nat.gt as N
import Data.Nat.gte as N
import Data.Nat.compare as N

instance
  OrdNat : Ord Nat
  OrdNat = record
    { compare = N.compare
    ; _<_ = N._<_
    ; _<=_ = N._<=_
    ; _>_ = N._>_
    ; _>=_ = N._>=_
    }
