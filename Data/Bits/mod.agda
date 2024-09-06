module Data.Bits.mod where

open import Data.Bits.Type
open import Data.Bits.sub
open import Data.Bits.lt
open import Data.Bits.eq
open import Data.Bits.strip
open import Data.Bool.if

-- Helper function for modulo operation
mod_helper : Bits → Bits → Bits
mod_helper a b = if (a < b)
                 then a
                 else mod_helper (strip (a - b)) b

-- Modulo operation for Bits
mod : Bits → Bits → Bits
mod a E = E
mod a (O E) = E
mod a b = mod_helper a b

-- Infix operator for Bits modulo
_%_ : Bits → Bits → Bits
_%_ = mod

infixl 7 _%_
