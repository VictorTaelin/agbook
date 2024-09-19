module Base.Bool.Lib where

open import Base.Bool.Type public
open import Base.Bool.and public
open import Base.Bool.eq public
open import Base.Bool.if public
open import Base.Bool.not public
open import Base.Bool.or public
open import Base.Bool.show public
open import Base.Bool.xor public

-- Re-export the Bool type
open Base.Bool.Type public using (Bool; True; False)
