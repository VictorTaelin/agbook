module Base.Buffer.get where

open import Base.Buffer.Type
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.U64.Type
open import Base.U64.Ord
open import Base.Nat.Ord
import Base.OrdMap.get as OrdMap

get : Buffer → U64 → Maybe U64
get (MkBuffer _ buffer) i = OrdMap.get i buffer
