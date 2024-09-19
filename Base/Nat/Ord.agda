module Base.Nat.Ord where

open import Base.Nat.Type
open import Base.Trait.Ord hiding (compare)

import Base.Nat.lt as N
import Base.Nat.lte as N
import Base.Nat.gt as N
import Base.Nat.gte as N
import Base.Nat.compare as N

instance
  OrdNat : Ord Nat
  OrdNat = record
    { compare = N.compare
    ; _<_ = N.lt
    ; _<=_ = N.lte
    ; _>_ = N.gt
    ; _>=_ = N.gte
    }
