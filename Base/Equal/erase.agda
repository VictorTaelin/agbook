module Base.Equal.erase where

open import Base.Equal.Type

primitive primEraseEquality : ∀ {a} {A : Set a} {x y : A} → x === y → x === y

erase : ∀ {a} {A : Set a} {x y : A} → x === y → x === y
erase = primEraseEquality
