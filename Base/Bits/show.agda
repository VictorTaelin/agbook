module Base.Bits.show where

open import Base.Bits.Bits
open import Base.String.String
open import Base.String.append

show : Bits -> String
show E     = "e"
show (O b) = "0" ++ show b
show (I b) = "1" ++ show b
