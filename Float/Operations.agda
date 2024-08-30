module Float.Operations where

open import Float.Main
open import Bool.Main

infixl 6 _f+_ _f-_
infixl 7 _f*_ _f/_
infixr 8 _f^_
infix 4 _f<_ _f==_

_f+_ : Float → Float → Float
_f+_ = primFloatPlus

_f-_ : Float → Float → Float
_f-_ = primFloatMinus

_f*_ : Float → Float → Float
_f*_ = primFloatTimes

_f/_ : Float → Float → Float
_f/_ = primFloatDiv

_f^_ : Float → Float → Float
_f^_ = primFloatPow

fnegate : Float → Float
fnegate = primFloatNegate

fsqrt : Float → Float
fsqrt = primFloatSqrt

fexp : Float → Float
fexp = primFloatExp

flog : Float → Float
flog = primFloatLog

fsin : Float → Float
fsin = primFloatSin

fcos : Float → Float
fcos = primFloatCos

ftan : Float → Float
ftan = primFloatTan

fasin : Float → Float
fasin = primFloatASin

facos : Float → Float
facos = primFloatACos

fatan : Float → Float
fatan = primFloatATan

fatan2 : Float → Float → Float
fatan2 = primFloatATan2

fsinh : Float → Float
fsinh = primFloatSinh

fcosh : Float → Float
fcosh = primFloatCosh

ftanh : Float → Float
ftanh = primFloatTanh

fasinh : Float → Float
fasinh = primFloatASinh

facosh : Float → Float
facosh = primFloatACosh

fatanh : Float → Float
fatanh = primFloatATanh

_f<_ : Float → Float → Bool
_f<_ = primFloatLess

_f==_ : Float → Float → Bool
_f==_ = primFloatEquality
