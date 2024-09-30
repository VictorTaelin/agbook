module Base.F64.floor where

open import Base.F64.F64
open import Base.Maybe.Maybe
open import Base.Int.Int

primitive primFloatFloor : F64 → Maybe Int

floor : F64 → Maybe Int
floor = primFloatFloor

