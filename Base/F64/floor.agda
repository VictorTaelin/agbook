module Base.F64.floor where

open import Base.F64.Type
open import Base.Maybe.Type
open import Base.Int.Type

primitive primFloatFloor : F64 -> Maybe Int

floor : F64 -> Maybe Int
floor = primFloatFloor

