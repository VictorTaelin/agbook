module ARC.DSL.Functions.mostcolor where

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
open import ARC.DSL.Functions.mostcommon
open import Base.Trait.Ord

mostcolor : Element → Integer
mostcolor (Lft cells) = mostcommon 0 (AsList (L.map (λ (x , y) → x) (S.to-list cells)))
mostcolor (Rgt grid)  = mostcommon 0 (AsList (L.concat grid))
