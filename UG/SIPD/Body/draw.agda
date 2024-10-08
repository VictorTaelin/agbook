module UG.SIPD.Body.draw where

import UG.Shape.draw as Shape
open import Base.IO.IO
open import Base.Unit.Unit
open import UG.SIPD.Body.Body
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.State.State

draw : Renderer → Body State → IO Unit
draw renderer body = Shape.draw renderer (Body.hitbox body)

