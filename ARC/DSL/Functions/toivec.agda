module ARC.DSL.Functions.toivec where

open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.IntegerList.IntegerList
open import ARC.DSL.Types.List.List

-- Converts an Integer to an IntegerPair representing a vertical vector.
-- - i: The input Integer.
-- = An IntegerList.
toivec : Integer → IntegerList
toivec i = i :: Zero :: []

