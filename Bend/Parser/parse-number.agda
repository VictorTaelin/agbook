module Bend.Parser.parse-number where

open import Base.Function.case
open import Base.Function.id
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.if
open import Base.Char.Char
open import Base.Char.Trait.Eq
open import Base.List.List
open import Base.List.filter
open import Base.Maybe.Maybe
import Base.Maybe.fold as Maybe
open import Base.F64.F64
open import Base.F64.div
import Base.F64.from-nat as F64
import Base.F64.from-int as F64
open import Base.F64.mul renaming (_*_ to _f*_)
open import Base.F64.add renaming (_+_ to _f+_)
open import Base.Int.Int
open import Base.Int.from-neg
open import Base.Int.from-nat
open import Base.Int.Trait.Ord
open import Base.Int.mul renaming (_*_ to _i*_)
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.Nat.exp
open import Base.String.String
open import Base.String.to-list
open import Base.String.append
open import Base.String.length
open import Base.String.from-list
open import Base.String.to-nat-base
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.Trait.Eq
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.take-while
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.fail
open import Base.Parser.advance-one
open import Base.Parser.advance-many
open import Base.Parser.peek-one
open import Base.Parser.peek-many
open import Base.Result.Result
open import Bend.Parser.consume-exactly
open import Bend.Parser.try-consume-exactly
open import Bend.Parser.is-digit-radix
open import Bend.Fun.Num.Num

-- Parses a Bend number literal.
parse-number : Parser Num
parse-number = do
  sign      <- parse-sign
  radix     <- parse-radix
  int-part  <- parse-num-radix radix
  frac-part <- parse-frac-part radix
  case frac-part , sign of λ where
    -- Fractional part: float
    (Some frac , _) → do
      let sign = Maybe.fold 1.0 F64.from-int sign
      pure (F24 (sign f* ((F64.from-nat int-part) f+ frac)))

    -- Sign but no fractional part: signed integer
    (None , (Some sign)) → do
      let val = sign i* (from-nat int-part)
      let in-range = (-0x00800000 <= val) && (val <= (from-nat 0x007fffff))
      if in-range then
          pure (I24 val)
        else
          fail-range-error "i24"

    -- No sign or fractional part: unsigned integer
    (None , _)       → do
      let val = int-part
      if val < 0x1000000 then
          pure (U24 val)
        else
          fail-range-error "u24"

  where

  parse-sign : Parser (Maybe Int)
  parse-sign = do
    head <- peek-one
    case head of λ where
      (Some '+') → advance-one >> pure (Some (from-nat 1))
      (Some '-') → advance-one >> pure (Some -1)
      _ → pure None

  parse-radix : Parser Nat
  parse-radix = do
    head <- peek-many 2
    case head of λ where
      (Some "0x") → advance-many 2 >> pure 16
      (Some "0b") → advance-many 2 >> pure 2
      _ → pure 10

  parse-num-radix : Nat → Parser Nat
  parse-num-radix radix = do
    digits <- take-while (is-digit-radix radix)
    let digits = from-list (filter (λ c → c != '_') (to-list digits))
    case (to-nat-base radix digits) of λ where
      (Some n) → pure n
      None     → fail "Expected number"

  parse-frac-part : Nat → Parser (Maybe F64)
  parse-frac-part radix = do
    has-frac <- try-consume-exactly "."
    if has-frac then (do
        digits <- take-while (is-digit-radix radix)
        let digits = from-list (filter (λ c → c != '_') (to-list digits))
        let num = Maybe.fold 0 id (to-nat-base radix digits)
        let num = (F64.from-nat num) / (F64.from-nat (radix ** (length digits)))
        pure (Some num))
      else
        pure None

  fail-range-error : String → Parser Num
  fail-range-error typ = fail ("Number literal outside of range for " ++ typ)
