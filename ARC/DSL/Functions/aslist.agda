module ARC.DSL.Functions.aslist where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.List.List

-- Constructs a list from two integers.
-- - a: The first integer.
-- - b: The second integer.
-- = An IntegerList containing the two input integers.
aslist : Integer → Integer → Container Integer
aslist a b = AsList (a :: b :: [])
