module ARC.DSL.Functions.maximum where

open import ARC.DSL.Types.IntegerSet.IntegerSet
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import Base.Maybe.Maybe

-- Returns the maximum value in an IntegerSet, or 0 if the set is empty.
-- - container: The IntegerSet to find the maximum value from.
-- = The maximum value in the set, or 0 if the set is empty.
maximum : IntegerSet → Integer
maximum container with S.maximum container
... | Some x = x
... | None   = 0

