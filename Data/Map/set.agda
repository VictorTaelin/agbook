module Data.Map.set where

open import Data.Map.Type
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Tree.Type
open import Data.Bool.Type
open import Data.Bool.if

-- Inserts a key-value pair into the Map.
-- - m: The Map to insert into.
-- - k: The Bits key to insert.
-- - v: The value to associate with the key.
-- = A new Map with the key-value pair inserted.
set : ∀ {A : Set} → Map A → Bits → A → Map A
set (node val lft rgt) e     v = node (some v) lft rgt
set (node val lft rgt) (o k) v = node val (set lft k v) rgt
set (node val lft rgt) (i k) v = node val lft (set rgt k v)
set leaf               e     v = node (some v) leaf leaf
set leaf               (o k) v = node none (set leaf k v) leaf
set leaf               (i k) v = node none leaf (set leaf k v)
