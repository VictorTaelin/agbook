module Bend.nat-to-name- where

open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.eq
open import Bend.nat-to-name

_ : nat-to-name 0 ≡ "a"
_ = refl

_ : nat-to-name 25 ≡ "z"
_ = refl

_ : nat-to-name 26 ≡ "aa"
_ = refl

_ : nat-to-name 27 ≡ "ab"
_ = refl

_ : nat-to-name 701 ≡ "zz"
_ = refl

_ : nat-to-name 702 ≡ "aaa"
_ = refl

_ : (nat-to-name 42 == nat-to-name 24) ≡ False
_ = refl

