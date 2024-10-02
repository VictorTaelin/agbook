module ARC.DSL.Functions.leastcolor where

open import ARC.DSL.Types.Element.Element
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Integer.Functions
open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Grid.Grid
open import ARC.DSL.Types.Object.Object
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Functions.leastcommon
open import Base.Trait.Ord

leastcolor : Element → Integer
leastcolor (Lft cells) = leastcommon 0 (AsList (L.map (λ (x , y) → x) (S.to-list cells)))
leastcolor (Rgt grid)  = leastcommon 0 (AsList (L.concat grid))
