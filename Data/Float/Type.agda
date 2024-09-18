module Data.Float.Type where

-- The primitive binary relations implement their IEEE 754 equivalents

open import Data.Bool.Type
open import Data.Int.Type
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.String.Type
open import Data.U64.Type

postulate Float : Set
{-# BUILTIN FLOAT Float #-}

primitive
  -- Relations
  primFloatIsInfinite        : Float → Bool
  primFloatIsNaN             : Float → Bool
  primFloatIsNegativeZero    : Float → Bool

  -- Conversions
  primNatToFloat             : Nat → Float
  primIntToFloat             : Int → Float
  primFloatToWord64          : Float → Maybe U64
  primRatioToFloat           : Int → Int → Float
  primShowFloat              : Float → String

  -- Operations
  primFloatPlus              : Float → Float → Float
  primFloatMinus             : Float → Float → Float
  primFloatTimes             : Float → Float → Float
  primFloatDiv               : Float → Float → Float
  primFloatPow               : Float → Float → Float
  primFloatNegate            : Float → Float
  primFloatSqrt              : Float → Float
  primFloatExp               : Float → Float
  primFloatLog               : Float → Float
  primFloatSin               : Float → Float
  primFloatCos               : Float → Float
  primFloatTan               : Float → Float
  primFloatASin              : Float → Float
  primFloatACos              : Float → Float
  primFloatATan              : Float → Float
  primFloatATan2             : Float → Float → Float
  primFloatSinh              : Float → Float
  primFloatCosh              : Float → Float
  primFloatTanh              : Float → Float
  primFloatASinh             : Float → Float
  primFloatACosh             : Float → Float
  primFloatATanh             : Float → Float

  -- Round operations
  primFloatRound             : Float → Maybe Int
  primFloatFloor             : Float → Maybe Int
  primFloatCeiling           : Float → Maybe Int

  primFloatLess              : Float → Float → Bool
  primFloatEquality          : Float → Float → Bool
  