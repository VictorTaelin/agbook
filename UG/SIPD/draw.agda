module UG.SIPD.draw where

import UG.SIPD.Renderer.clear as Renderer
import UG.SIPD.Renderer.present as Renderer
import UG.SIPD.Renderer.set-renderer-draw-color as Renderer
import UG.SIPD.State.draw as State
import UG.Shape.draw as Shape
open import Base.IO.ALL
open import Base.List.List
open import Base.Unit.Unit
open import Base.V2.V2
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.State.State

open import UG.Shape.Shape
open import UG.Shape.square

s : Shape
s = square (MkV2 100.0 250.0) 100.0

-- Renders the current game state and a sample square shape.
-- This function performs the following steps:
-- 1. Sets the renderer draw color to white.
-- 2. Clears the renderer.
-- 3. Draws the current game state.
-- 4. Draws a sample square shape.
-- 5. Presents the renderer, updating the display.
--
-- - renderer: The SDL renderer to use for drawing.
-- - state: The current game state to be rendered.
-- = An IO action that updates the display with the current game state and sample shape.
draw : Renderer → State → IO Unit
draw renderer state = do
  Renderer.set-renderer-draw-color renderer 255 255 255 255
  Renderer.clear renderer
  State.draw renderer state
  Shape.draw renderer s
  Renderer.present renderer

