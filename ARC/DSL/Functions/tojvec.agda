module ARC.DSL.Functions.tojvec where

open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.IntegerList.IntegerList
open import ARC.DSL.Types.List.List

-- Converts an Integer to an IntegerPair representing a horizontal vector.
-- - i: The input Integer.
-- = An IntegerList.
tojvec : Integer → IntegerList
tojvec j = Zero :: j :: []
