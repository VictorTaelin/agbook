module Bend.Parser.parse-number- where

open import Base.Int.from-nat
open import Base.Int.from-neg
open import Base.Equal.Equal
open import Base.Maybe.Maybe
open import Base.Parser.State
open import Base.Result.Result
open import Base.Parser.Reply
open import Base.Parser.Error
open import Bend.Parser.parse-number
open import Bend.Fun.Num.Num

-- Successful parsing tests

_ : parse-number (new-parser-state "42") ≡ Done (MkReply (MkState "" 2) (U24 42))
_ = refl

_ : parse-number (new-parser-state "+42") ≡ Done (MkReply (MkState "" 3) (I24 (from-nat 42)))
_ = refl

_ : parse-number (new-parser-state "-42") ≡ Done (MkReply (MkState "" 3) (I24 (from-neg 42)))
_ = refl

_ : parse-number (new-parser-state "+0") ≡ Done (MkReply (MkState "" 2) (I24 (from-nat 0)))
_ = refl

_ : parse-number (new-parser-state "-0") ≡ Done (MkReply (MkState "" 2) (I24 (from-neg 0)))
_ = refl

_ : parse-number (new-parser-state "0") ≡ Done (MkReply (MkState "" 1) (U24 0))
_ = refl

_ : parse-number (new-parser-state "0x1A") ≡ Done (MkReply (MkState "" 4) (U24 26))
_ = refl

_ : parse-number (new-parser-state "-0x1A") ≡ Done (MkReply (MkState "" 5) (I24 (from-neg 26)))
_ = refl

_ : parse-number (new-parser-state "0b1010") ≡ Done (MkReply (MkState "" 6) (U24 10))
_ = refl

_ : parse-number (new-parser-state "-0b1010") ≡ Done (MkReply (MkState "" 7) (I24 (from-neg 10)))
_ = refl

_ : parse-number (new-parser-state "3.14") ≡ Done (MkReply (MkState "" 4) (F24 3.14))
_ = refl

_ : parse-number (new-parser-state "-3.14") ≡ Done (MkReply (MkState "" 5) (F24 -3.14))
_ = refl

_ : parse-number (new-parser-state "+3.14") ≡ Done (MkReply (MkState "" 5) (F24 3.14))
_ = refl

_ : parse-number (new-parser-state "0.5") ≡ Done (MkReply (MkState "" 3) (F24 0.5))
_ = refl

_ : parse-number (new-parser-state "-0.5") ≡ Done (MkReply (MkState "" 4) (F24 -0.5))
_ = refl

_ : parse-number (new-parser-state "1.") ≡ Done (MkReply (MkState "" 2) (F24 1.0))
_ = refl

-- Spurious characters in the middle are considered as the next token
_ : parse-number (new-parser-state "1e10") ≡ Done (MkReply (MkState "e10" 1) (U24 1))
_ = refl


-- Error parsing tests

_ : parse-number (new-parser-state "") ≡ Fail (MkError 0 "Expected number")
_ = refl

_ : parse-number (new-parser-state "abc") ≡ Fail (MkError 0 "Expected number")
_ = refl

_ : parse-number (new-parser-state "+") ≡ Fail (MkError 1 "Expected number")
_ = refl

_ : parse-number (new-parser-state "-") ≡ Fail (MkError 1 "Expected number")
_ = refl

_ : parse-number (new-parser-state "0x") ≡ Fail (MkError 2 "Expected number")
_ = refl

_ : parse-number (new-parser-state "0b") ≡ Fail (MkError 2 "Expected number")
_ = refl

_ : parse-number (new-parser-state "0xG") ≡ Fail (MkError 2 "Expected number")
_ = refl

_ : parse-number (new-parser-state "0b2") ≡ Fail (MkError 2 "Expected number")
_ = refl

_ : parse-number (new-parser-state "16777216") ≡ Fail (MkError 8 "Number literal outside of range for u24")
_ = refl

_ : parse-number (new-parser-state "-8388609") ≡ Fail (MkError 8 "Number literal outside of range for i24")
_ = refl
