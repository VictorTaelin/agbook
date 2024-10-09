module Base.List.enumerate- where

open import Base.Equal.Equal
open import Base.Equal.apply
open import Base.List.List
open import Base.List.enumerate
open import Base.List.length
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String

_ : enumerate ("0" :: "1" :: "2" :: []) ≡ (0 , "0") :: (1 , "1") :: (2 , "2") :: []
_ = refl

_ : ∀{A : Set} → enumerate {A} [] ≡ []
_ = refl

