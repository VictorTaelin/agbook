module Bend.Parser.parse-number where

open import Data.Function.case
open import Data.Function.id
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Bool.if
open import Data.Char.Type
open import Data.Char.eq
open import Data.List.Type
open import Data.List.filter
open import Data.Maybe.Type
open import Data.Maybe.maybe
open import Data.Float.Type
open import Data.Float.div
open import Data.Float.mul renaming (_*_ to _f*_)
open import Data.Float.add renaming (_+_ to _f+_)
open import Data.Int.Type
open import Data.Int.from-neg
open import Data.Int.from-nat
open import Data.Int.ord
open import Data.Int.mul renaming (_*_ to _i*_)
open import Data.Nat.Type
open import Data.Nat.ord
open import Data.Nat.exp using () renaming (_^_ to _exp_)
open import Data.String.Type
open import Data.String.to-list
open import Data.String.append
open import Data.String.length
open import Data.String.from-list
open import Data.String.to-nat-base
open import Data.Pair.Type
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.take-while
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.fail
open import Data.Parser.alternative
open import Data.Result.Type
open import Bend.Parser.consume-exactly
open import Bend.Parser.try-consume-exactly
open import Bend.Parser.is-digit-radix
open import Bend.Fun.Num.Type

parse-number : Parser Num
parse-number = do
  sign      ← parse-sign
  radix     ← parse-radix
  int-part  ← parse-num-radix radix
  frac-part ← parse-frac-part radix
  case frac-part , sign of λ where
    -- Fractional part: float
    (Some frac , _) → do
      let sign = maybe 1.0 primIntToFloat sign
      pure (F24 (sign f* ((primNatToFloat int-part) f+ frac)))

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
  parse-sign = (consume-exactly "+" >> pure (Some (from-nat 1)))
           <|> (consume-exactly "-" >> pure (Some -1))
           <|> pure None

  parse-radix : Parser Nat
  parse-radix = (consume-exactly "0x" >> pure 16)
            <|> (consume-exactly "0b" >> pure 2)
            <|> pure 10

  parse-num-radix : Nat → Parser Nat
  parse-num-radix radix = do
    digits ← take-while (is-digit-radix radix)
    let digits = from-list (filter (λ c → c != '_') (to-list digits))
    case (to-nat-base radix digits) of λ where
      (Some n) → pure n
      None     → fail "Expected number"

  parse-frac-part : Nat → Parser (Maybe Float)
  parse-frac-part radix = do
    has-frac ← try-consume-exactly "."
    if has-frac then (do
        digits ← take-while (is-digit-radix radix)
        let digits = from-list (filter (λ c → c != '_') (to-list digits))
        let num = maybe 0 id (to-nat-base radix digits)
        let num = (primNatToFloat num) / (primNatToFloat (radix exp (length digits)))
        pure (Some num))
      else
        pure None

  fail-range-error : String → Parser Num
  fail-range-error typ = fail ("Number literal outside of range for " ++ typ)
