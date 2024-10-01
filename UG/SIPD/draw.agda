module UG.SIPD.draw where

import UG.SIPD.State.draw as State
import UG.Shape.draw as Shape
open import Base.IO.ALL
open import Base.List.List
open import Base.Unit.Unit
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.Renderer.clear as Renderer
open import UG.SIPD.Renderer.present as Renderer
open import UG.SIPD.State.State
open import UG.SIPD.Window.Window

open import UG.Shape.Shape
open import UG.Shape.square
open import Base.V2.V2

s : Shape
s = square (MkV2 100.0 250.0) 1.0

draw : Renderer → State → IO Unit
draw renderer state = do
  Renderer.clear renderer
  State.draw renderer state
  --Shape.draw renderer s
  Renderer.present renderer


