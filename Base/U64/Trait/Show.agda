module Base.U64.Trait.Show where

open import Base.U64.U64
import Base.U64.show as U64
import Base.Trait.Show as Show

instance
  ShowU64 : Show.Show U64
  ShowU64 = record { to-string = U64.show }
